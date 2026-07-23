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
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    final isDesktop = screenWidth >= 900;

    if (_questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(category?.title ?? 'Quiz')),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(isDesktop ? 32 : 24),
            child: Text(
              'Aucune question disponible pour ce thème.',
              style: TextStyle(fontSize: isDesktop ? 18 : 16),
            ),
          ),
        ),
      );
    }

    if (_quizFinished) {
      return Scaffold(
        appBar: AppBar(title: Text(category?.title ?? 'Quiz')),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(isDesktop ? 32 : 24),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: isDesktop ? 500 : double.infinity),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.emoji_events,
                    color: const Color(0xFF1877F2),
                    size: isDesktop ? 80 : 64,
                  ),
                  SizedBox(height: isDesktop ? 24 : 16),
                  Text(
                    'Score final : $_score / ${_questions.length}',
                    style: TextStyle(
                      fontSize: isDesktop ? 24 : 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: isDesktop ? 32 : 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: isDesktop ? 56 : 48,
                        child: OutlinedButton(
                          onPressed: () => context.pop(),
                          child: const Text('Retour aux thèmes'),
                        ),
                      ),
                      SizedBox(width: isDesktop ? 16 : 12),
                      SizedBox(
                        height: isDesktop ? 56 : 48,
                        child: ElevatedButton(
                          onPressed: _restart,
                          child: const Text('Rejouer'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    final question = _questions[_currentIndex];

    return Scaffold(
      appBar: AppBar(title: Text(category?.title ?? 'Quiz')),
      body: Padding(
        padding: EdgeInsets.all(isDesktop ? 32 : isTablet ? 24 : 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: (_currentIndex + 1) / _questions.length,
              backgroundColor: const Color(0xFFE4E6EB),
              color: const Color(0xFF1877F2),
              minHeight: isDesktop ? 8 : 6,
              borderRadius: BorderRadius.circular(4),
            ),
            SizedBox(height: isDesktop ? 12 : 8),
            Text(
              'Question ${_currentIndex + 1}/${_questions.length}',
              style: TextStyle(
                fontSize: isDesktop ? 14 : 12,
                color: Theme.of(context).textTheme.bodySmall?.color,
              ),
            ),
            SizedBox(height: isDesktop ? 24 : 16),
            Text(
              question.questionText,
              style: TextStyle(
                fontSize: isDesktop ? 20 : isTablet ? 18 : 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: isDesktop ? 32 : 24),
            Expanded(
              child: ListView.builder(
                itemCount: question.options.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: isDesktop ? 12 : 10,
                    ),
                    child: AnswerButton(
                      text: question.options[index],
                      isSelected: _selectedIndex == index,
                      isCorrect: index == question.correctAnswerIndex,
                      showResult: _showResult,
                      onTap: () => _selectAnswer(index),
                    ),
                  );
                },
              ),
            ),
            if (_showResult)
              SizedBox(
                width: double.infinity,
                height: isDesktop ? 56 : isTablet ? 52 : 48,
                child: ElevatedButton(
                  onPressed: _nextQuestion,
                  child: Text(
                    _currentIndex < _questions.length - 1
                        ? 'Question suivante'
                        : 'Voir le résultat',
                    style: TextStyle(fontSize: isDesktop ? 18 : 16),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}