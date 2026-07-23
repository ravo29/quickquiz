import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quickquiz/models/quiz_category.dart';
import 'package:quickquiz/widgets/category_card.dart';

void main() {
  group('CategoryCard Widget Tests', () {
    testWidgets('should display category title', (tester) async {
      const category = QuizCategory(
        id: 'geo',
        title: 'Géographie',
        description: 'Questions sur les pays',
        icon: Icons.public,
        color: Color(0xFF1877F2),
      );

      bool tapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CategoryCard(
              category: category,
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      expect(find.text('Géographie'), findsOneWidget);
    });

    testWidgets('should display category description', (tester) async {
      const category = QuizCategory(
        id: 'geo',
        title: 'Géographie',
        description: 'Questions sur les pays et capitales',
        icon: Icons.public,
        color: Color(0xFF1877F2),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CategoryCard(
              category: category,
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.text('Questions sur les pays et capitales'), findsOneWidget);
    });

    testWidgets('should display category icon', (tester) async {
      const category = QuizCategory(
        id: 'geo',
        title: 'Géographie',
        description: 'Questions sur les pays',
        icon: Icons.public,
        color: Color(0xFF1877F2),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CategoryCard(
              category: category,
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.public), findsOneWidget);
    });

    testWidgets('should call onTap when tapped', (tester) async {
      const category = QuizCategory(
        id: 'geo',
        title: 'Géographie',
        description: 'Questions sur les pays',
        icon: Icons.public,
        color: Color(0xFF1877F2),
      );

      bool tapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CategoryCard(
              category: category,
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(InkWell));
      await tester.pump();

      expect(tapped, true);
    });

    testWidgets('should truncate long description', (tester) async {
      const category = QuizCategory(
        id: 'geo',
        title: 'Géographie',
        description: 'This is a very long description that should be truncated '
            'because it exceeds the maximum lines allowed for display',
        icon: Icons.public,
        color: Color(0xFF1877F2),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CategoryCard(
              category: category,
              onTap: () {},
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text(category.description));
      expect(textWidget.maxLines, 2);
      expect(textWidget.overflow, TextOverflow.ellipsis);
    });

    testWidgets('should render in light theme', (tester) async {
      const category = QuizCategory(
        id: 'geo',
        title: 'Géographie',
        description: 'Questions sur les pays',
        icon: Icons.public,
        color: Color(0xFF1877F2),
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: CategoryCard(
              category: category,
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.byType(Card), findsOneWidget);
    });

    testWidgets('should render in dark theme', (tester) async {
      const category = QuizCategory(
        id: 'geo',
        title: 'Géographie',
        description: 'Questions sur les pays',
        icon: Icons.public,
        color: Color(0xFF1877F2),
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            body: CategoryCard(
              category: category,
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.byType(Card), findsOneWidget);
    });
  });
}
