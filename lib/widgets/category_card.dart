import 'package:flutter/material.dart';
import '../models/quiz_category.dart';

/// Carte réutilisable affichant un thème de culture générale.
/// Utilisée dans le GridView de QuizListScreen.
class CategoryCard extends StatelessWidget {
  final QuizCategory category;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
Container(
  width: 44,
  height: 44,
  decoration: BoxDecoration(
    color: category.color.withValues(alpha: isDark ? 0.25 : 0.12),
    borderRadius: BorderRadius.circular(12),
  ),
  child: Icon(category.icon, color: category.color, size: 24),
),
              const SizedBox(height: 12),
              Text(
                category.title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                category.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}