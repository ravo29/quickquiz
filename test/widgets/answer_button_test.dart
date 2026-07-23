import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quickquiz/widgets/answer_button.dart';

void main() {
  group('AnswerButton Widget Tests', () {
    testWidgets('should display answer text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnswerButton(
              text: 'Paris',
              isSelected: false,
              isCorrect: false,
              showResult: false,
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.text('Paris'), findsOneWidget);
    });

    testWidgets('should call onTap when tapped and not showing result', (tester) async {
      bool tapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnswerButton(
              text: 'Paris',
              isSelected: false,
              isCorrect: false,
              showResult: false,
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      expect(tapped, true);
    });

    testWidgets('should not call onTap when showing result', (tester) async {
      bool tapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnswerButton(
              text: 'Paris',
              isSelected: false,
              isCorrect: false,
              showResult: true,
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      expect(tapped, false);
    });

    testWidgets('should show check icon when correct and showing result', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnswerButton(
              text: 'Paris',
              isSelected: true,
              isCorrect: true,
              showResult: true,
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.check_circle), findsOneWidget);
    });

    testWidgets('should show cancel icon when selected incorrect and showing result', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnswerButton(
              text: 'London',
              isSelected: true,
              isCorrect: false,
              showResult: true,
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.cancel), findsOneWidget);
    });

    testWidgets('should not show icons when not showing result', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnswerButton(
              text: 'Paris',
              isSelected: true,
              isCorrect: true,
              showResult: false,
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.check_circle), findsNothing);
      expect(find.byIcon(Icons.cancel), findsNothing);
    });

    testWidgets('should animate when state changes', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnswerButton(
              text: 'Paris',
              isSelected: false,
              isCorrect: false,
              showResult: false,
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.byType(AnimatedContainer), findsOneWidget);
    });

    testWidgets('should handle long text', (tester) async {
      const longText = 'This is a very long answer that should still be displayed '
          'properly within the button widget without any issues';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnswerButton(
              text: longText,
              isSelected: false,
              isCorrect: false,
              showResult: false,
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.text(longText), findsOneWidget);
    });
  });
}
