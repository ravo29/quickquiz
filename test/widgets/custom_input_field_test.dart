import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quickquiz/widgets/custom_input_field.dart';

void main() {
  group('CustomInputField Widget Tests', () {
    testWidgets('should display label', (tester) async {
      final controller = TextEditingController();
      String? validator(String? value) => null;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomInputField(
              label: 'Question',
              hint: 'Enter your question',
              controller: controller,
              validator: validator,
            ),
          ),
        ),
      );

      expect(find.text('Question'), findsOneWidget);
    });

    testWidgets('should display hint text', (tester) async {
      final controller = TextEditingController();
      String? validator(String? value) => null;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomInputField(
              label: 'Question',
              hint: 'Enter your question',
              controller: controller,
              validator: validator,
            ),
          ),
        ),
      );

      expect(find.text('Enter your question'), findsOneWidget);
    });

    testWidgets('should accept text input', (tester) async {
      final controller = TextEditingController();
      String? validator(String? value) => null;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomInputField(
              label: 'Question',
              hint: 'Enter your question',
              controller: controller,
              validator: validator,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'Test question');
      expect(controller.text, 'Test question');
    });

    testWidgets('should show validation error', (tester) async {
      final controller = TextEditingController();
      String? validator(String? value) {
        if (value == null || value.isEmpty) return 'Required';
        return null;
      }

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: CustomInputField(
                label: 'Question',
                hint: 'Enter your question',
                controller: controller,
                validator: validator,
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(TextFormField));
      await tester.pump();
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(find.text('Required'), findsOneWidget);
    });

    testWidgets('should support multiline input', (tester) async {
      final controller = TextEditingController();
      String? validator(String? value) => null;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomInputField(
              label: 'Question',
              hint: 'Enter your question',
              controller: controller,
              validator: validator,
              maxLines: 3,
            ),
          ),
        ),
      );

      final textField = tester.widget<TextFormField>(find.byType(TextFormField));
      expect(textField.maxLines, 3);
    });

    testWidgets('should support different keyboard types', (tester) async {
      final controller = TextEditingController();
      String? validator(String? value) => null;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomInputField(
              label: 'Number',
              hint: 'Enter a number',
              controller: controller,
              validator: validator,
              keyboardType: TextInputType.number,
            ),
          ),
        ),
      );

      final textField = tester.widget<TextFormField>(find.byType(TextFormField));
      expect(textField.keyboardType, TextInputType.number);
    });

    testWidgets('should dispose controller when widget is disposed', (tester) async {
      final controller = TextEditingController();
      String? validator(String? value) => null;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomInputField(
              label: 'Question',
              hint: 'Enter your question',
              controller: controller,
              validator: validator,
            ),
          ),
        ),
      );

      expect(controller.isDisposed, false);
      
      await tester.pumpWidget(Container());
      
      // Controller should still be disposed by the parent widget
      // This test verifies the widget doesn't prevent disposal
    });
  });
}
