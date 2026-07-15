import 'package:dio/dio.dart';
import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:islamic_learning_app/core/database/database.dart';
import 'package:islamic_learning_app/core/repositories/content_repository.dart';
import 'package:islamic_learning_app/models/content_response.dart';

void main() {
  late AppDatabase db;
  late ContentRepository repository;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    repository = ContentRepository(
      dio: _StubDio(),
      db: db,
    );
  });

  tearDown(() async {
    await db.close();
  });

  test('ContentResponse parses nested API payload', () {
    final response = ContentResponse.fromJson({
      'data': {
        'ustazes': [
          {
            'id': 1,
            'name': 'Ustaz Ahmad',
            'slug': 'ustaz-ahmad',
            'is_active': true,
            'sort_order': 0,
          },
        ],
        'topics': [
          {
            'id': 10,
            'name': 'Aqeedah',
            'slug': 'aqeedah',
            'icon': 'book',
            'color': '#1B5E20',
          },
        ],
        'derses': [
          {
            'id': 100,
            'title': 'Foundations',
            'slug': 'foundations',
            'ustaz_id': 1,
            'topic_id': 10,
            'pdf_page_count': 50,
            'is_published': true,
            'episodes': [
              {
                'id': 1000,
                'ders_id': 100,
                'title': 'Episode 1',
                'audio_url': 'https://example.com/ep1.mp3',
                'start_page': 1,
                'sort_order': 0,
                'is_published': true,
              },
              {
                'id': 1001,
                'ders_id': 100,
                'title': 'Episode 2',
                'audio_url': 'https://example.com/ep2.mp3',
                'start_page': 20,
                'sort_order': 1,
                'is_published': true,
              },
            ],
          },
        ],
      },
    });

    expect(response.ustazes, hasLength(1));
    expect(response.topics, hasLength(1));
    expect(response.derses, hasLength(1));
    expect(response.derses.first.episodes, hasLength(2));
  });

  test('upsertContent upserts active content and soft-deactivates stale rows', () async {
    await db.cachedUstazesDao.insert(
      CachedUstazesCompanion.insert(
        id: const Value(99),
        name: 'Removed Ustaz',
        slug: 'removed-ustaz',
        isActive: const Value(true),
      ),
    );
    await db.cachedDersesDao.insert(
      CachedDersesCompanion.insert(
        id: const Value(200),
        title: 'Old Ders',
        slug: 'old-ders',
        ustazId: 99,
        isPublished: const Value(true),
      ),
    );

    await repository.upsertContent(_sampleContent());

    final activeUstazes = await db.cachedUstazesDao.getActive();
    expect(activeUstazes.map((u) => u.id), [1]);

    final removedUstaz = await db.cachedUstazesDao.getById(99);
    expect(removedUstaz, isNotNull);
    expect(removedUstaz!.isActive, false);

    final publishedDerses = await db.cachedDersesDao.getPublished();
    expect(publishedDerses.map((d) => d.id), [100]);

    final oldDers = await db.cachedDersesDao.getById(200);
    expect(oldDers, isNotNull);
    expect(oldDers!.isPublished, false);

    final episodes = await db.cachedEpisodesDao.getByDersId(100);
    expect(episodes, hasLength(2));
    expect(episodes.first.endPage, 19);
    expect(episodes.last.endPage, 50);
  });
}

ContentResponse _sampleContent() {
  return ContentResponse.fromJson({
    'ustazes': [
      {
        'id': 1,
        'name': 'Ustaz Ahmad',
        'slug': 'ustaz-ahmad',
        'is_active': true,
      },
    ],
    'topics': [
      {
        'id': 10,
        'name': 'Aqeedah',
        'slug': 'aqeedah',
      },
    ],
    'derses': [
      {
        'id': 100,
        'title': 'Foundations',
        'slug': 'foundations',
        'ustaz_id': 1,
        'topic_id': 10,
        'pdf_page_count': 50,
        'is_published': true,
        'episodes': [
          {
            'id': 1000,
            'ders_id': 100,
            'title': 'Episode 1',
            'audio_url': 'https://example.com/ep1.mp3',
            'start_page': 1,
            'is_published': true,
          },
          {
            'id': 1001,
            'ders_id': 100,
            'title': 'Episode 2',
            'audio_url': 'https://example.com/ep2.mp3',
            'start_page': 20,
            'is_published': true,
          },
        ],
      },
    ],
  });
}

class _StubDio implements Dio {
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}
