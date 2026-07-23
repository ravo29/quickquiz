import 'package:flutter_test/flutter_test.dart';
import 'package:quickquiz/models/question.dart';
import 'package:quickquiz/services/mock_quiz_data.dart';

void main() {
  group('Tests des Modèles & Données Mockées', () {
    test('Question instanciation correcte', () {
      const q = Question(
        id: '1',
        questionText: 'Test ?',
        options: ['A', 'B'],
        correctAnswerIndex: 0,
      );

      expect(q.id, '1');
      expect(q.options.length, 2);
      expect(q.correctAnswerIndex, 0);
    });

    test('Chaque catégorie possède au moins une question dans MockQuizData', () {
      for (final cat in MockQuizData.categories) {
        final questions = MockQuizData.questionsByCategory[cat.id];
        expect(questions, isNotNull);
        expect(questions!.isNotEmpty, isTrue);
      }
    });
  });
}