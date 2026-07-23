import 'package:flutter/material.dart';

/// Carte d'affichage du score avec animation et style visuel attractif.
/// Utilisée pour présenter les résultats finaux du quiz.
class ScoreCard extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final String? title;
  final VoidCallback? onRetry;
  final VoidCallback? onBack;

  const ScoreCard({
    super.key,
    required this.score,
    required this.totalQuestions,
    this.title,
    this.onRetry,
    this.onBack,
  });

  double get percentage => totalQuestions > 0 ? (score / totalQuestions) * 100 : 0;

  String get performanceMessage {
    if (percentage >= 80) return 'Excellent ! 🎉';
    if (percentage >= 60) return 'Bien joué ! 👍';
    if (percentage >= 40) return 'Pas mal ! 💪';
    return 'Continue à t\'entraîner ! 📚';
  }

  Color get scoreColor {
    if (percentage >= 80) return const Color(0xFF42B72A);
    if (percentage >= 60) return const Color(0xFF1877F2);
    if (percentage >= 40) return const Color(0xFFFF9500);
    return const Color(0xFFE41E3F);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title != null) ...[
              Text(
                title!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
            ],
            Icon(
              Icons.emoji_events,
              color: scoreColor,
              size: 64,
            ),
            const SizedBox(height: 16),
            Text(
              'Score final : $score / $totalQuestions',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${percentage.toStringAsFixed(0)}%',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: scoreColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              performanceMessage,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).textTheme.bodyMedium?.color,
              ),
            ),
            if (onRetry != null || onBack != null) ...[
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (onBack != null)
                    OutlinedButton(
                      onPressed: onBack,
                      child: const Text('Retour'),
                    ),
                  if (onBack != null && onRetry != null)
                    const SizedBox(width: 12),
                  if (onRetry != null)
                    ElevatedButton(
                      onPressed: onRetry,
                      child: const Text('Rejouer'),
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
