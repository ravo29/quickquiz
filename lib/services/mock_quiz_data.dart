import 'package:flutter/material.dart';
import '../models/question.dart';
import '../models/quiz_category.dart';

/// Source unique des données mockées de Culture Générale.
/// Aucune donnée n'est écrite en dur dans les écrans : tout passe par ce service.
class MockQuizData {
  MockQuizData._();

  static const List<QuizCategory> categories = [
    QuizCategory(
      id: 'geo',
      title: 'Géographie',
      description: 'Pays, capitales, reliefs et frontières du monde.',
      icon: Icons.public,
      color: Color(0xFF1877F2),
    ),
    QuizCategory(
      id: 'histoire',
      title: 'Histoire',
      description: 'Grands événements et figures historiques.',
      icon: Icons.account_balance,
      color: Color(0xFF42B72A),
    ),
    QuizCategory(
      id: 'sciences',
      title: 'Sciences & Nature',
      description: 'Physique, biologie et phénomènes naturels.',
      icon: Icons.eco,
      color: Color(0xFF00A8E8),
    ),
    QuizCategory(
      id: 'arts',
      title: 'Arts & Littérature',
      description: 'Peinture, écrivains et courants artistiques.',
      icon: Icons.palette,
      color: Color(0xFFF7B928),
    ),
    QuizCategory(
      id: 'cinema',
      title: 'Cinéma',
      description: 'Films cultes, réalisateurs et récompenses.',
      icon: Icons.movie,
      color: Color(0xFFE41E3F),
    ),
  ];

  static const List<Question> questions = [
    // Géographie
    Question(
      id: 'q1',
      categoryId: 'geo',
      questionText: 'Quelle est la capitale de l\'Australie ?',
      options: ['Sydney', 'Melbourne', 'Canberra', 'Perth'],
      correctAnswerIndex: 2,
    ),
    Question(
      id: 'q2',
      categoryId: 'geo',
      questionText: 'Quel est le plus long fleuve du monde ?',
      options: ['Amazone', 'Nil', 'Yangtsé', 'Mississippi'],
      correctAnswerIndex: 1,
    ),
    Question(
      id: 'q3',
      categoryId: 'geo',
      questionText: 'Combien de continents compte-t-on généralement ?',
      options: ['5', '6', '7', '8'],
      correctAnswerIndex: 2,
    ),
    // Histoire
    Question(
      id: 'q4',
      categoryId: 'histoire',
      questionText: 'En quelle année a eu lieu la prise de la Bastille ?',
      options: ['1789', '1792', '1804', '1815'],
      correctAnswerIndex: 0,
    ),
    Question(
      id: 'q5',
      categoryId: 'histoire',
      questionText: 'Qui était le premier empereur romain ?',
      options: ['Jules César', 'Auguste', 'Néron', 'Trajan'],
      correctAnswerIndex: 1,
    ),
    Question(
      id: 'q6',
      categoryId: 'histoire',
      questionText: 'Quelle guerre s\'est terminée en 1918 ?',
      options: [
        'Guerre de Sécession',
        'Première Guerre mondiale',
        'Guerre de Crimée',
        'Guerre franco-prussienne',
      ],
      correctAnswerIndex: 1,
    ),
    // Sciences & Nature
    Question(
      id: 'q7',
      categoryId: 'sciences',
      questionText: 'Quelle planète est surnommée la "planète rouge" ?',
      options: ['Vénus', 'Mars', 'Jupiter', 'Saturne'],
      correctAnswerIndex: 1,
    ),
    Question(
      id: 'q8',
      categoryId: 'sciences',
      questionText: 'Quel gaz les plantes absorbent-elles pour la photosynthèse ?',
      options: ['Oxygène', 'Azote', 'Dioxyde de carbone', 'Hydrogène'],
      correctAnswerIndex: 2,
    ),
    Question(
      id: 'q9',
      categoryId: 'sciences',
      questionText: 'Combien d\'os compte le corps humain adulte ?',
      options: ['186', '206', '226', '246'],
      correctAnswerIndex: 1,
    ),
    // Arts & Littérature
    Question(
      id: 'q10',
      categoryId: 'arts',
      questionText: 'Qui a peint "La Nuit étoilée" ?',
      options: ['Monet', 'Van Gogh', 'Picasso', 'Renoir'],
      correctAnswerIndex: 1,
    ),
    Question(
      id: 'q11',
      categoryId: 'arts',
      questionText: 'Qui a écrit "Les Misérables" ?',
      options: ['Émile Zola', 'Victor Hugo', 'Albert Camus', 'Molière'],
      correctAnswerIndex: 1,
    ),
    Question(
      id: 'q12',
      categoryId: 'arts',
      questionText: 'À quel mouvement artistique appartient Salvador Dalí ?',
      options: ['Cubisme', 'Surréalisme', 'Impressionnisme', 'Baroque'],
      correctAnswerIndex: 1,
    ),
    // Cinéma
    Question(
      id: 'q13',
      categoryId: 'cinema',
      questionText: 'Qui a réalisé "Inception" ?',
      options: [
        'Steven Spielberg',
        'Christopher Nolan',
        'Martin Scorsese',
        'James Cameron',
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      id: 'q14',
      categoryId: 'cinema',
      questionText: 'Quel film a remporté l\'Oscar du meilleur film en 2020 (cérémonie) ?',
      options: ['1917', 'Joker', 'Parasite', 'Once Upon a Time in Hollywood'],
      correctAnswerIndex: 2,
    ),
    Question(
      id: 'q15',
      categoryId: 'cinema',
      questionText: 'Dans quel studio a été produit "Toy Story" ?',
      options: ['DreamWorks', 'Pixar', 'Illumination', 'Blue Sky Studios'],
      correctAnswerIndex: 1,
    ),
  ];

  /// Retourne toutes les questions liées à une catégorie donnée.
  static List<Question> questionsForCategory(String categoryId) {
    return questions.where((q) => q.categoryId == categoryId).toList();
  }

  /// Retourne une catégorie via son id, ou null si absente.
  static QuizCategory? categoryById(String id) {
    try {
      return categories.firstWhere((c) => c.id == id);
    } catch (_) {
      return null;
    }
  }
}