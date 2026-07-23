import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:quickquiz/main.dart';
import 'package:quickquiz/screens/home_screen.dart';
import 'package:quickquiz/services/theme_notifier.dart';

void main() {
  group('HomeScreen Integration Tests', () {
    testWidgets('should display app title', (tester) async {
      await tester.pumpWidget(const QuickQuizApp());
      await tester.pumpAndSettle();

      expect(find.text('QuickQuiz'), findsWidgets);
    });

    testWidgets('should display start quiz button', (tester) async {
      await tester.pumpWidget(const QuickQuizApp());
      await tester.pumpAndSettle();

      expect(find.text('Commencer un quiz'), findsOneWidget);
    });

    testWidgets('should display add question button', (tester) async {
      await tester.pumpWidget(const QuickQuizApp());
      await tester.pumpAndSettle();

      expect(find.text('Ajouter une question'), findsOneWidget);
    });

    testWidgets('should navigate to quiz list when start button is tapped', (tester) async {
      await tester.pumpWidget(const QuickQuizApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Commencer un quiz'));
      await tester.pumpAndSettle();

      expect(find.text('Thèmes de culture générale'), findsOneWidget);
    });

    testWidgets('should navigate to add question when add button is tapped', (tester) async {
      await tester.pumpWidget(const QuickQuizApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Ajouter une question'));
      await tester.pumpAndSettle();

      expect(find.text('Ajouter une question'), findsOneWidget);
    });

    testWidgets('should toggle theme when theme button is tapped', (tester) async {
      final initialMode = themeNotifier.value;
      
      await tester.pumpWidget(const QuickQuizApp());
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.light_mode));
      await tester.pumpAndSettle();

      expect(themeNotifier.value, isNot(equals(initialMode)));
    });

    testWidgets('should display description text', (tester) async {
      await tester.pumpWidget(const QuickQuizApp());
      await tester.pumpAndSettle();

      expect(find.textContaining('Teste ta culture générale'), findsOneWidget);
    });

    testWidgets('should display logo or fallback icon', (tester) async {
      await tester.pumpWidget(const QuickQuizApp());
      await tester.pumpAndSettle();

      expect(find.byType(Image), findsOneWidget);
    });
  });
}
