import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quickquiz/main.dart';

void main() {
  group('AddQuestionScreen Integration Tests', () {
    testWidgets('should display form fields', (tester) async {
      await tester.pumpWidget(const QuickQuizApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Ajouter une question'));
      await tester.pumpAndSettle();

      expect(find.text('Ajouter une question'), findsOneWidget);
      expect(find.text('Thème'), findsOneWidget);
      expect(find.text('Question'), findsOneWidget);
      expect(find.text('Option 1'), findsOneWidget);
      expect(find.text('Option 2'), findsOneWidget);
      expect(find.text('Réponse correcte'), findsOneWidget);
    });

    testWidgets('should display save button', (tester) async {
      await tester.pumpWidget(const QuickQuizApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Ajouter une question'));
      await tester.pumpAndSettle();

      expect(find.text('Enregistrer'), findsOneWidget);
    });

    testWidgets('should show validation error for empty fields', (tester) async {
      await tester.pumpWidget(const QuickQuizApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Ajouter une question'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Enregistrer'));
      await tester.pumpAndSettle();

      expect(find.text('Ce champ est obligatoire.'), findsWidgets);
    });

    testWidgets('should show error when no category selected', (tester) async {
      await tester.pumpWidget(const QuickQuizApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Ajouter une question'));
      await tester.pumpAndSettle();

      await tester.enterText(find.ancestor(of: find.text('Question'), matching: find.byType(TextFormField)), 'Test question');
      await tester.enterText(find.ancestor(of: find.text('Option 1'), matching: find.byType(TextFormField)), 'Option A');
      await tester.enterText(find.ancestor(of: find.text('Option 2'), matching: find.byType(TextFormField)), 'Option B');
      await tester.enterText(find.ancestor(of: find.text('Réponse correcte'), matching: find.byType(TextFormField)), 'Option A');
      
      await tester.tap(find.text('Enregistrer'));
      await tester.pumpAndSettle();

      expect(find.text('Veuillez sélectionner un thème.'), findsOneWidget);
    });

    testWidgets('should show success message when form is valid', (tester) async {
      await tester.pumpWidget(const QuickQuizApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Ajouter une question'));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(DropdownButtonFormField<String>));
      await tester.pumpAndSettle();
      
      await tester.tap(find.text('Géographie').last);
      await tester.pumpAndSettle();

      await tester.enterText(find.ancestor(of: find.text('Question'), matching: find.byType(TextFormField)), 'Test question');
      await tester.enterText(find.ancestor(of: find.text('Option 1'), matching: find.byType(TextFormField)), 'Option A');
      await tester.enterText(find.ancestor(of: find.text('Option 2'), matching: find.byType(TextFormField)), 'Option B');
      await tester.enterText(find.ancestor(of: find.text('Réponse correcte'), matching: find.byType(TextFormField)), 'Option A');
      
      await tester.tap(find.text('Enregistrer'));
      await tester.pumpAndSettle();

      expect(find.text('Question ajoutée avec succès !'), findsOneWidget);
    });

    testWidgets('should reset form after successful submission', (tester) async {
      await tester.pumpWidget(const QuickQuizApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Ajouter une question'));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(DropdownButtonFormField<String>));
      await tester.pumpAndSettle();
      
      await tester.tap(find.text('Géographie').last);
      await tester.pumpAndSettle();

      await tester.enterText(find.ancestor(of: find.text('Question'), matching: find.byType(TextFormField)), 'Test question');
      await tester.enterText(find.ancestor(of: find.text('Option 1'), matching: find.byType(TextFormField)), 'Option A');
      await tester.enterText(find.ancestor(of: find.text('Option 2'), matching: find.byType(TextFormField)), 'Option B');
      await tester.enterText(find.ancestor(of: find.text('Réponse correcte'), matching: find.byType(TextFormField)), 'Option A');
      
      await tester.tap(find.text('Enregistrer'));
      await tester.pumpAndSettle();

      final questionField = tester.widget<TextFormField>(find.ancestor(of: find.text('Question'), matching: find.byType(TextFormField)));
      expect(questionField.controller?.text, '');
    });
  });
}
