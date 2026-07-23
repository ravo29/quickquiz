import 'package:flutter/material.dart';
import '../models/question.dart';
import '../models/quiz_category.dart';

class MockQuizData {
  static const List<QuizCategory> categories = [
    QuizCategory(
      id: 'geo',
      title: 'Géographie',
      description: 'Capitales, pays, fleuves et merveilles du monde.',
      icon: Icons.public,
      color: Color(0xFF1877F2),
    ),
    QuizCategory(
      id: 'hist',
      title: 'Histoire',
      description: 'Grandes civilisations, dynasties et événements majeurs.',
      icon: Icons.history_edu,
      color: Color(0xFF1877F2),
    ),
    QuizCategory(
      id: 'sci',
      title: 'Sciences & Nature',
      description: 'Physique, chimie, astronomie et faune sauvage.',
      icon: Icons.science,
      color: Color(0xFF1877F2),
    ),
    QuizCategory(
      id: 'art',
      title: 'Arts & Littérature',
      description: 'Peinture classique, romans célèbres et poésie.',
      icon: Icons.menu_book,
      color: Color(0xFF1877F2),
    ),
    QuizCategory(
      id: 'cine',
      title: 'Cinéma & Pop Culture',
      description: 'Films cultes, acteurs, séries et musique.',
      icon: Icons.movie,
      color: Color(0xFF1877F2),
    ),
  ];

  static const Map<String, List<Question>> questionsByCategory = {
    'geo': [
      Question(
        id: 'g1',
        questionText: 'Quelle est la capitale du Japon ?',
        options: ['Kyoto', 'Tokyo', 'Osaka', 'Nagoya'],
        correctAnswerIndex: 1,
      ),
      Question(
        id: 'g2',
        questionText: 'Quel est le plus long fleuve du monde ?',
        options: ['Le Mississipi', 'Le Nil', 'L’Amazone', 'Le Yangtze'],
        correctAnswerIndex: 2,
      ),
    ],
    'hist': [
      Question(
        id: 'h1',
        questionText: 'En quelle année a eu lieu la Révolution Française ?',
        options: ['1789', '1799', '1815', '1776'],
        correctAnswerIndex: 0,
      ),
      Question(
        id: 'h2',
        questionText: 'Qui était le premier empereur de Rome ?',
        options: ['Jules César', 'Auguste', 'Néron', 'Marc Aurèle'],
        correctAnswerIndex: 1,
      ),
    ],
    'sci': [
      Question(
        id: 's1',
        questionText: 'Quel est le symbole chimique de l\'or ?',
        options: ['Ag', 'Fe', 'Au', 'Cu'],
        correctAnswerIndex: 2,
      ),
    ],
    'art': [
      Question(
        id: 'a1',
        questionText: 'Qui a peint La Joconde ?',
        options: ['Vincent van Gogh', 'Léonard de Vinci', 'Claude Monet', 'Pablo Picasso'],
        correctAnswerIndex: 1,
      ),
    ],
    'cine': [
      Question(
        id: 'c1',
        questionText: 'Quel film a remporté l\'Oscar du meilleur film en 2020 ?',
        options: ['1917', 'Parasite', 'Joker', 'Once Upon a Time in Hollywood'],
        correctAnswerIndex: 1,
      ),
    ],
  };
}