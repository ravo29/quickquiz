import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../services/mock_quiz_data.dart';
import '../models/question.dart';
import '../widgets/answer_button.dart';

class QuizGameScreen extends StatefulWidget {
  final String categoryId;

  const QuizGameScreen({super.key, required this.categoryId});

  @override
  State<QuizGameScreen> createState() => _QuizGameScreenState();
}

class _QuizGameScreenState extends State<QuizGameScreen> {
  late final List<Question> _questions;
  int _currentIndex = 0;
  int _score = 0;
  int? _selectedIndex;
  bool _showResult = false;
  bool _quizFinished = false;

  @override
  void initState() {
    super.initState();
    _questions = MockQuizData.questionsForCategory(widget.categoryId);
  }

  void _selectAnswer(int index) {
    if (_showResult) return;
    setState(() {
      _selectedIndex = index;
      _showResult = true;
      if (_questions[_currentIndex].isCorrect(index)) {
        _score++;
      }
    });
  }

  void _nextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedIndex = null;
        _showResult = false;
      });
    } else {
      setState(() => _quizFinished = true);
    }
  }

  void _restart() {
    setState(() {
      _currentIndex = 0;
      _score = 0;
      _selectedIndex = null;
      _showResult = false;
      _quizFinished = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final category = MockQuizData.categoryById(widget.categoryId);

    if (_questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(category?.title ?? 'Quiz')),
        body: const Center(
          child: Text('Aucune question disponible pour ce thème.'),
        ),
      );
    }

    if (_quizFinished) {
      return Scaffold(
        appBar: AppBar(title: Text(category?.title ?? 'Quiz')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.emoji_events, color: Color(0xFF1877F2), size: 64),
                const SizedBox(height: 16),
                Text(
                  'Score final : $_score / ${_questions.length}',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () => context.pop(),
                      child: const Text('Retour aux thèmes'),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: _restart,
                      child: const Text('Rejouer'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    final question = _questions[_currentIndex];

    return Scaffold(
      appBar: AppBar(title: Text(category?.title ?? 'Quiz')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: (_currentIndex + 1) / _questions.length,
              backgroundColor: const Color(0xFFE4E6EB),
              color: const Color(0xFF1877F2),
              minHeight: 6,
              borderRadius: BorderRadius.circular(4),
            ),
            const SizedBox(height: 8),
            Text(
              'Question ${_currentIndex + 1}/${_questions.length}',
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).textTheme.bodySmall?.color,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              question.questionText,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: question.options.length,
                itemBuilder: (context, index) {
                  return AnswerButton(
                    text: question.options[index],
                    isSelected: _selectedIndex == index,
                    isCorrect: index == question.correctAnswerIndex,
                    showResult: _showResult,
                    onTap: () => _selectAnswer(index),
                  );
                },
              ),
            ),
            if (_showResult)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _nextQuestion,
                  child: Text(
                    _currentIndex < _questions.length - 1
                        ? 'Question suivante'
                        : 'Voir le résultat',
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}