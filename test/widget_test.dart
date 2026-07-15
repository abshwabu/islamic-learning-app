import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:islamic_learning_app/app.dart';
import 'package:islamic_learning_app/core/database/database.dart';
import 'package:islamic_learning_app/features/content/providers/content_sync_provider.dart';

void main() {
  testWidgets('App renders home screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          databaseProvider.overrideWith((ref) {
            final db = AppDatabase(NativeDatabase.memory());
            ref.onDispose(db.close);
            return db;
          }),
          contentSyncBootstrapProvider.overrideWith((ref) {}),
        ],
        child: const IslamicLearningApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('By Ustaz'), findsOneWidget);
    expect(find.text('By Topic'), findsOneWidget);
    expect(find.text('Search ustaz, topic, or ders'), findsOneWidget);
  });
}
