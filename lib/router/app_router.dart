import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';
import '../screens/quiz_list_screen.dart';
import '../screens/quiz_game_screen.dart';
import '../screens/add_question_screen.dart';

/// Configuration centralisée de la navigation déclarative avec go_router.
/// Routes nommées + passage de paramètres (ex: categoryId vers QuizGameScreen).
class AppRouter {
  AppRouter._();

  static const String home = 'home';
  static const String quizList = 'quizList';
  static const String quizGame = 'quizGame';
  static const String addQuestion = 'addQuestion';

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/quiz-list',
        name: quizList,
        builder: (context, state) => const QuizListScreen(),
      ),
      GoRoute(
        path: '/quiz-game/:categoryId',
        name: quizGame,
        builder: (context, state) {
          final categoryId = state.pathParameters['categoryId']!;
          return QuizGameScreen(categoryId: categoryId);
        },
      ),
      GoRoute(
        path: '/add-question',
        name: addQuestion,
        builder: (context, state) => const AddQuestionScreen(),
      ),
    ],
  );
}