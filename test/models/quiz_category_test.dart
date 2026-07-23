import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quickquiz/models/quiz_category.dart';

void main() {
  group('QuizCategory Model Tests', () {
    test('should create QuizCategory with valid parameters', () {
      const category = QuizCategory(
        id: 'geo',
        title: 'Géographie',
        description: 'Questions sur les pays, capitales et géographie mondiale',
        icon: Icons.public,
        color: Color(0xFF1877F2),
      );

      expect(category.id, 'geo');
      expect(category.title, 'Géographie');
      expect(category.description, 'Questions sur les pays, capitales et géographie mondiale');
      expect(category.icon, Icons.public);
      expect(category.color, const Color(0xFF1877F2));
    });

    test('should handle different icon types', () {
      const category1 = QuizCategory(
        id: 'history',
        title: 'Histoire',
        description: 'Questions historiques',
        icon: Icons.history,
        color: Color(0xFF42B72A),
      );

      const category2 = QuizCategory(
        id: 'science',
        title: 'Sciences',
        description: 'Questions scientifiques',
        icon: Icons.science,
        color: Color(0xFFE41E3F),
      );

      expect(category1.icon, Icons.history);
      expect(category2.icon, Icons.science);
    });

    test('should handle different colors', () {
      const category1 = QuizCategory(
        id: 'arts',
        title: 'Arts',
        description: 'Questions artistiques',
        icon: Icons.palette,
        color: Color(0xFFFF9500),
      );

      const category2 = QuizCategory(
        id: 'cinema',
        title: 'Cinéma',
        description: 'Questions cinématographiques',
        icon: Icons.movie,
        color: Color(0xFF9C27B0),
      );

      expect(category1.color, const Color(0xFFFF9500));
      expect(category2.color, const Color(0xFF9C27B0));
    });

    test('should handle empty description', () {
      const category = QuizCategory(
        id: 'test',
        title: 'Test Category',
        description: '',
        icon: Icons.star,
        color: Color(0xFF1877F2),
      );

      expect(category.description, '');
    });

    test('should handle long descriptions', () {
      const longDescription = 'Ceci est une description très longue qui contient '
          'beaucoup de détails sur cette catégorie de quiz. '
          'Elle peut inclure des informations sur le type de questions, '
          'la difficulté, et d\'autres métadonnées pertinentes.';

      const category = QuizCategory(
        id: 'test',
        title: 'Test Category',
        description: longDescription,
        icon: Icons.star,
        color: Color(0xFF1877F2),
      );

      expect(category.description, longDescription);
      expect(category.description.length, longDescription.length);
    });
  });
}
