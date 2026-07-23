import 'package:flutter/material.dart';

/// Barre de progression personnalisée pour afficher l'avancement du quiz.
/// Supporte différents styles et couleurs personnalisables.
class ProgressBar extends StatelessWidget {
  final double progress;
  final Color? backgroundColor;
  final Color? progressColor;
  final double height;
  final BorderRadius? borderRadius;
  final String? label;

  const ProgressBar({
    super.key,
    required this.progress,
    this.backgroundColor,
    this.progressColor,
    this.height = 6,
    this.borderRadius,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBackgroundColor = backgroundColor ?? const Color(0xFFE4E6EB);
    final effectiveProgressColor = progressColor ?? const Color(0xFF1877F2);
    final effectiveBorderRadius = borderRadius ?? BorderRadius.circular(4);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).textTheme.bodySmall?.color,
            ),
          ),
          const SizedBox(height: 8),
        ],
        ClipRRect(
          borderRadius: effectiveBorderRadius,
          child: LinearProgressIndicator(
            value: progress.clamp(0.0, 1.0),
            backgroundColor: effectiveBackgroundColor,
            color: effectiveProgressColor,
            minHeight: height,
          ),
        ),
      ],
    );
  }
}
