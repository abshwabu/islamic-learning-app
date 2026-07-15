import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:islamic_learning_app/app.dart';

void main() {
  testWidgets('App renders home screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: IslamicLearningApp(),
      ),
    );

    expect(find.text('Islamic Learning'), findsOneWidget);
    expect(find.byIcon(Icons.home), findsOneWidget);
  });
}
