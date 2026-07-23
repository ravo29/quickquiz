import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/add_question_screen.dart';
import '../screens/home_screen.dart';
import '../screens/quiz_game_screen.dart';
import '../screens/quiz_list_screen.dart';

class AppRouter {
  static final ValueNotifier<ThemeMode> themeModeNotifier =
      ValueNotifier<ThemeMode>(ThemeMode.light);

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => HomeScreen(
          themeNotifier: themeModeNotifier,
        ),
      ),
      GoRoute(
        path: '/categories',
        name: 'categories',
        builder: (context, state) => const QuizListScreen(),
      ),
      GoRoute(
        path: '/game/:categoryId',
        name: 'game',
        builder: (context, state) {
          final categoryId = state.pathParameters['categoryId'] ?? 'geo';
          return QuizGameScreen(categoryId: categoryId);
        },
      ),
      GoRoute(
        path: '/add-question',
        name: 'addQuestion',
        builder: (context, state) => const AddQuestionScreen(),
      ),
    ],
  );
}