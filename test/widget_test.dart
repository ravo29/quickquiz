
import 'package:flutter_test/flutter_test.dart';
import 'package:quickquiz/main.dart';

void main() {
  testWidgets('Affichage correct de l\'écran d\'accueil QuickQuiz', (WidgetTester tester) async {
    await tester.pumpWidget(const QuickQuizApp());

    expect(find.text('Bienvenue sur QuickQuiz'), findsOneWidget);
    expect(find.text('Commencer un Quiz'), findsOneWidget);
    expect(find.text('Ajouter une Question'), findsOneWidget);
  });
}