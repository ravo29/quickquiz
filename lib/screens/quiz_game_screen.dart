import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../services/mock_quiz_data.dart';
import '../widgets/answer_button.dart';

class QuizGameScreen extends StatefulWidget {
  final String categoryId;

  const QuizGameScreen({super.key, required this.categoryId});

  @override
  State<QuizGameScreen> createState() => _QuizGameScreenState();
}

class _QuizGameScreenState extends State<QuizGameScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _isFinished = false;

  void _answerQuestion(int selectedIndex, int correctAnswerIndex) {
    if (selectedIndex == correctAnswerIndex) {
      _score++;
    }

    final questions = MockQuizData.questionsByCategory[widget.categoryId] ?? [];
    if (_currentQuestionIndex + 1 < questions.length) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      setState(() {
        _isFinished = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final questions = MockQuizData.questionsByCategory[widget.categoryId] ?? [];

    if (questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Quiz')),
        body: const Center(
          child: Text('Aucune question disponible pour ce thème.'),
        ),
      );
    }

    if (_isFinished) {
      final percentage = (_score / questions.length) * 100;

      return Scaffold(
        appBar: AppBar(title: const Text('Résultat')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logoquiz.png',
                  height: 80,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.emoji_events, size: 80, color: Color(0xFF1877F2)),
                ),
                const SizedBox(height: 16),
                Text(
                  'Quiz Terminé !',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  'Score : $_score / ${questions.length} (${percentage.toStringAsFixed(0)}%)',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1877F2),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  onPressed: () => context.go('/categories'),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Retour aux Thèmes'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final currentQuestion = questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${_currentQuestionIndex + 1}/${questions.length}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(
              value: (_currentQuestionIndex + 1) / questions.length,
              color: const Color(0xFF1877F2),
              minHeight: 6,
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  currentQuestion.questionText,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: currentQuestion.options.length,
                itemBuilder: (context, index) {
                  return AnswerButton(
                    optionText: currentQuestion.options[index],
                    onPressed: () => _answerQuestion(
                      index,
                      currentQuestion.correctAnswerIndex,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}