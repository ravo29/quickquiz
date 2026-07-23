import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:quickquiz/main.dart';

void main() {
  group('QuizListScreen Integration Tests', () {
    testWidgets('should display all categories', (tester) async {
      await tester.pumpWidget(const QuickQuizApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Commencer un quiz'));
      await tester.pumpAndSettle();

      expect(find.text('Thèmes de culture générale'), findsOneWidget);
      expect(find.byType(CategoryCard), findsWidgets);
    });

    testWidgets('should display search field', (tester) async {
      await tester.pumpWidget(const QuickQuizApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Commencer un quiz'));
      await tester.pumpAndSettle();

      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Rechercher un thème...'), findsOneWidget);
    });

    testWidgets('should filter categories when searching', (tester) async {
      await tester.pumpWidget(const QuickQuizApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Commencer un quiz'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'Géographie');
      await tester.pumpAndSettle();

      expect(find.text('Géographie'), findsOneWidget);
    });

    testWidgets('should show no results message when search matches nothing', (tester) async {
      await tester.pumpWidget(const QuickQuizApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Commencer un quiz'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'xyz123');
      await tester.pumpAndSettle();

      expect(find.text('Aucun thème trouvé.'), findsOneWidget);
    });

    testWidgets('should navigate to quiz game when category is tapped', (tester) async {
      await tester.pumpWidget(const QuickQuizApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Commencer un quiz'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Géographie'));
      await tester.pumpAndSettle();

      expect(find.textContaining('Question'), findsOneWidget);
    });

    testWidgets('should display responsive grid layout', (tester) async {
      await tester.pumpWidget(const QuickQuizApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Commencer un quiz'));
      await tester.pumpAndSettle();

      expect(find.byType(GridView), findsOneWidget);
    });
  });
}
