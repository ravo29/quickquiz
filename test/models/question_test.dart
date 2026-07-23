import 'package:flutter_test/flutter_test.dart';
import 'package:quickquiz/models/question.dart';

void main() {
  group('Question Model Tests', () {
    test('should create Question with valid parameters', () {
      const question = Question(
        id: 'q1',
        categoryId: 'geo',
        questionText: 'What is the capital of France?',
        options: ['Paris', 'London', 'Berlin', 'Madrid'],
        correctAnswerIndex: 0,
      );

      expect(question.id, 'q1');
      expect(question.categoryId, 'geo');
      expect(question.questionText, 'What is the capital of France?');
      expect(question.options.length, 4);
      expect(question.correctAnswerIndex, 0);
    });

    test('isCorrect should return true for correct answer', () {
      const question = Question(
        id: 'q1',
        categoryId: 'geo',
        questionText: 'What is the capital of France?',
        options: ['Paris', 'London', 'Berlin', 'Madrid'],
        correctAnswerIndex: 0,
      );

      expect(question.isCorrect(0), true);
    });

    test('isCorrect should return false for incorrect answer', () {
      const question = Question(
        id: 'q1',
        categoryId: 'geo',
        questionText: 'What is the capital of France?',
        options: ['Paris', 'London', 'Berlin', 'Madrid'],
        correctAnswerIndex: 0,
      );

      expect(question.isCorrect(1), false);
      expect(question.isCorrect(2), false);
      expect(question.isCorrect(3), false);
    });

    test('fromMap should create Question from Map', () {
      final map = {
        'id': 'q1',
        'categoryId': 'geo',
        'questionText': 'What is the capital of France?',
        'options': ['Paris', 'London', 'Berlin', 'Madrid'],
        'correctAnswerIndex': 0,
      };

      final question = Question.fromMap(map);

      expect(question.id, 'q1');
      expect(question.categoryId, 'geo');
      expect(question.questionText, 'What is the capital of France?');
      expect(question.options, ['Paris', 'London', 'Berlin', 'Madrid']);
      expect(question.correctAnswerIndex, 0);
    });

    test('toMap should convert Question to Map', () {
      const question = Question(
        id: 'q1',
        categoryId: 'geo',
        questionText: 'What is the capital of France?',
        options: ['Paris', 'London', 'Berlin', 'Madrid'],
        correctAnswerIndex: 0,
      );

      final map = question.toMap();

      expect(map['id'], 'q1');
      expect(map['categoryId'], 'geo');
      expect(map['questionText'], 'What is the capital of France?');
      expect(map['options'], ['Paris', 'London', 'Berlin', 'Madrid']);
      expect(map['correctAnswerIndex'], 0);
    });

    test('fromMap and toMap should be reversible', () {
      const originalQuestion = Question(
        id: 'q1',
        categoryId: 'geo',
        questionText: 'What is the capital of France?',
        options: ['Paris', 'London', 'Berlin', 'Madrid'],
        correctAnswerIndex: 0,
      );

      final map = originalQuestion.toMap();
      final reconstructedQuestion = Question.fromMap(map);

      expect(reconstructedQuestion.id, originalQuestion.id);
      expect(reconstructedQuestion.categoryId, originalQuestion.categoryId);
      expect(reconstructedQuestion.questionText, originalQuestion.questionText);
      expect(reconstructedQuestion.options, originalQuestion.options);
      expect(reconstructedQuestion.correctAnswerIndex, originalQuestion.correctAnswerIndex);
    });

    test('should handle questions with 2 options', () {
      const question = Question(
        id: 'q2',
        categoryId: 'science',
        questionText: 'Is the Earth round?',
        options: ['Yes', 'No'],
        correctAnswerIndex: 0,
      );

      expect(question.options.length, 2);
      expect(question.isCorrect(0), true);
      expect(question.isCorrect(1), false);
    });

    test('should handle questions with 6 options', () {
      const question = Question(
        id: 'q3',
        categoryId: 'history',
        questionText: 'Which year did WWII end?',
        options: ['1943', '1944', '1945', '1946', '1947', '1948'],
        correctAnswerIndex: 2,
      );

      expect(question.options.length, 6);
      expect(question.isCorrect(2), true);
    });
  });
}
