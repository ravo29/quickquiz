import 'package:flutter/material.dart';

/// Bouton de réponse réutilisable pour l'écran de quiz.
/// Gère visuellement 4 états : neutre, sélectionné, correct, incorrect.
class AnswerButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isCorrect;
  final bool showResult;
  final VoidCallback onTap;

  const AnswerButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.isCorrect,
    required this.showResult,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const fbBlue = Color(0xFF1877F2);
    const successColor = Color(0xFF42B72A);
    const errorColor = Color(0xFFE41E3F);

    Color borderColor = Theme.of(context).dividerColor;
    Color backgroundColor = Theme.of(context).cardColor;
    Color textColor = Theme.of(context).textTheme.bodyLarge?.color ??
        Colors.black87;

   if (showResult && isCorrect) {
  borderColor = successColor;
  backgroundColor = successColor.withValues(alpha: 0.12);
  textColor = successColor;
} else if (showResult && isSelected && !isCorrect) {
  borderColor = errorColor;
  backgroundColor = errorColor.withValues(alpha: 0.12);
  textColor = errorColor;
} else if (isSelected) {
  borderColor = fbBlue;
  backgroundColor = fbBlue.withValues(alpha: 0.08);
  textColor = fbBlue;
}

    return GestureDetector(
      onTap: showResult ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor, width: 1.4),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
            ),
            if (showResult && isCorrect)
              const Icon(Icons.check_circle, color: successColor, size: 20),
            if (showResult && isSelected && !isCorrect)
              const Icon(Icons.cancel, color: errorColor, size: 20),
          ],
        ),
      ),
    );
  }
}