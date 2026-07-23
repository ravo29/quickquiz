import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quickquiz/main.dart';

void main() {
  group('QuizGameScreen Integration Tests', () {
    testWidgets('should display question when game starts', (tester) async {
      await tester.pumpWidget(const QuickQuizApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Commencer un quiz'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Géographie'));
      await tester.pumpAndSettle();

      expect(find.textContaining('Question'), findsOneWidget);
      expect(find.byType(AnswerButton), findsWidgets);
    });

    testWidgets('should display progress indicator', (tester) async {
      await tester.pumpWidget(const QuickQuizApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Commencer un quiz'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Géographie'));
      await tester.pumpAndSettle();

      expect(find.byType(LinearProgressIndicator), findsOneWidget);
    });

    testWidgets('should display question counter', (tester) async {
      await tester.pumpWidget(const QuickQuizApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Commencer un quiz'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Géographie'));
      await tester.pumpAndSettle();

      expect(find.textContaining('Question 1/'), findsOneWidget);
    });

    testWidgets('should select answer when tapped', (tester) async {
      await tester.pumpWidget(const QuickQuizApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Commencer un quiz'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Géographie'));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(AnswerButton).first);
      await tester.pumpAndSettle();

      expect(find.text('Question suivante'), findsOneWidget);
    });

    testWidgets('should show correct answer indicator', (tester) async {
      await tester.pumpWidget(const QuickQuizApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Commencer un quiz'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Géographie'));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(AnswerButton).first);
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.check_circle), findsOneWidget);
    });

    testWidgets('should navigate to next question', (tester) async {
      await tester.pumpWidget(const QuickQuizApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Commencer un quiz'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Géographie'));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(AnswerButton).first);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Question suivante'));
      await tester.pumpAndSettle();

      expect(find.textContaining('Question 2/'), findsOneWidget);
    });

    testWidgets('should show final score when quiz is finished', (tester) async {
      await tester.pumpWidget(const QuickQuizApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Commencer un quiz'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Géographie'));
      await tester.pumpAndSettle();

      // Answer all questions
      for (int i = 0; i < 5; i++) {
        await tester.tap(find.byType(AnswerButton).first);
        await tester.pumpAndSettle();
        
        if (find.text('Question suivante').evaluate().isNotEmpty) {
          await tester.tap(find.text('Question suivante'));
          await tester.pumpAndSettle();
        } else if (find.text('Voir le résultat').evaluate().isNotEmpty) {
          await tester.tap(find.text('Voir le résultat'));
          await tester.pumpAndSettle();
        }
      }

      expect(find.textContaining('Score final'), findsOneWidget);
      expect(find.byIcon(Icons.emoji_events), findsOneWidget);
    });

    testWidgets('should display replay button on finish', (tester) async {
      await tester.pumpWidget(const QuickQuizApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Commencer un quiz'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Géographie'));
      await tester.pumpAndSettle();

      // Answer all questions quickly
      for (int i = 0; i < 5; i++) {
        await tester.tap(find.byType(AnswerButton).first);
        await tester.pumpAndSettle();
        
        if (find.text('Question suivante').evaluate().isNotEmpty) {
          await tester.tap(find.text('Question suivante'));
          await tester.pumpAndSettle();
        } else if (find.text('Voir le résultat').evaluate().isNotEmpty) {
          await tester.tap(find.text('Voir le résultat'));
          await tester.pumpAndSettle();
          break;
        }
      }

      expect(find.text('Rejouer'), findsOneWidget);
    });

    testWidgets('should restart quiz when replay button is tapped', (tester) async {
      await tester.pumpWidget(const QuickQuizApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Commencer un quiz'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Géographie'));
      await tester.pumpAndSettle();

      // Answer all questions
      for (int i = 0; i < 5; i++) {
        await tester.tap(find.byType(AnswerButton).first);
        await tester.pumpAndSettle();
        
        if (find.text('Question suivante').evaluate().isNotEmpty) {
          await tester.tap(find.text('Question suivante'));
          await tester.pumpAndSettle();
        } else if (find.text('Voir le résultat').evaluate().isNotEmpty) {
          await tester.tap(find.text('Voir le résultat'));
          await tester.pumpAndSettle();
          break;
        }
      }

      await tester.tap(find.text('Rejouer'));
      await tester.pumpAndSettle();

      expect(find.textContaining('Question 1/'), findsOneWidget);
    });

    testWidgets('should navigate back to categories when back button is tapped', (tester) async {
      await tester.pumpWidget(const QuickQuizApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Commencer un quiz'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Géographie'));
      await tester.pumpAndSettle();

      // Answer all questions
      for (int i = 0; i < 5; i++) {
        await tester.tap(find.byType(AnswerButton).first);
        await tester.pumpAndSettle();
        
        if (find.text('Question suivante').evaluate().isNotEmpty) {
          await tester.tap(find.text('Question suivante'));
          await tester.pumpAndSettle();
        } else if (find.text('Voir le résultat').evaluate().isNotEmpty) {
          await tester.tap(find.text('Voir le résultat'));
          await tester.pumpAndSettle();
          break;
        }
      }

      await tester.tap(find.text('Retour aux thèmes'));
      await tester.pumpAndSettle();

      expect(find.text('Thèmes de culture générale'), findsOneWidget);
    });
  });
}
