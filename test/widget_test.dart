import 'package:flutter_test/flutter_test.dart';
import 'package:quickquiz/main.dart';

void main() {
  testWidgets('QuickQuizApp démarre sur HomeScreen', (tester) async {
    await tester.pumpWidget(const QuickQuizApp());
    expect(find.text('QuickQuiz'), findsWidgets);
  });
}