import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:islamic_learning_app/core/database/database.dart';
import 'package:islamic_learning_app/core/network/dio_client.dart';
import 'package:islamic_learning_app/core/repositories/content_repository.dart';
import 'package:islamic_learning_app/features/content/providers/content_sync_provider.dart';

void main() {
  late AppDatabase db;
  late ProviderContainer container;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
  });

  tearDown(() async {
    container.dispose();
    await db.close();
  });

  test('unreachable backend sets lastError and does not crash', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://example.invalid'));
    dio.httpClientAdapter = _FailingAdapter();

    container = ProviderContainer(
      overrides: [
        databaseProvider.overrideWithValue(db),
        dioProvider.overrideWithValue(dio),
        contentRepositoryProvider.overrideWithValue(
          ContentRepository(dio: dio, db: db),
        ),
      ],
    );

    await container.read(contentSyncProvider.notifier).sync();

    final state = container.read(contentSyncProvider);
    expect(state.isSyncing, isFalse);
    expect(state.hasError, isTrue);
    expect(state.lastError, contains('Unable to reach the server'));
    expect(await db.cachedUstazesDao.getActive(), isEmpty);
  });

  test('successful sync clears error and populates cache', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://example.test'));
    dio.httpClientAdapter = _SuccessAdapter();

    container = ProviderContainer(
      overrides: [
        databaseProvider.overrideWithValue(db),
        dioProvider.overrideWithValue(dio),
        contentRepositoryProvider.overrideWithValue(
          ContentRepository(dio: dio, db: db),
        ),
      ],
    );

    await container.read(contentSyncProvider.notifier).sync();

    final state = container.read(contentSyncProvider);
    expect(state.isSyncing, isFalse);
    expect(state.hasError, isFalse);
    expect(state.lastSyncedAt, isNotNull);
    expect(await db.cachedUstazesDao.getActive(), hasLength(1));
  });
}

class _FailingAdapter implements HttpClientAdapter {
  @override
  void close({bool force = false}) {}

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    throw DioException(
      requestOptions: options,
      type: DioExceptionType.connectionError,
      error: Exception('SocketException: Failed host lookup'),
      message: 'SocketException: Failed host lookup',
    );
  }
}

class _SuccessAdapter implements HttpClientAdapter {
  @override
  void close({bool force = false}) {}

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final body = jsonEncode({
      'data': {
        'ustazes': [
          {
            'id': 1,
            'name': 'Ustaz',
            'slug': 'ustaz',
            'is_active': true,
            'sort_order': 0,
          },
        ],
        'topics': <Map<String, dynamic>>[],
        'derses': <Map<String, dynamic>>[],
      },
    });

    return ResponseBody.fromString(
      body,
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }
}
