import 'package:flutter/material.dart';

/// Modèle représentant un thème (catégorie) de culture générale.
class QuizCategory {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  const QuizCategory({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });
}