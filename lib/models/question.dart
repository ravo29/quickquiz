/// Modèle représentant une question de quiz de culture générale.
class Question {
  final String id;
  final String categoryId;
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;

  const Question({
    required this.id,
    required this.categoryId,
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
  });

  /// Vérifie si l'index de réponse fourni est correct.
  bool isCorrect(int selectedIndex) => selectedIndex == correctAnswerIndex;

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'] as String,
      categoryId: map['categoryId'] as String,
      questionText: map['questionText'] as String,
      options: List<String>.from(map['options'] as List),
      correctAnswerIndex: map['correctAnswerIndex'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categoryId': categoryId,
      'questionText': questionText,
      'options': options,
      'correctAnswerIndex': correctAnswerIndex,
    };
  }
}