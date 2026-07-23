import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../router/app_router.dart';
import '../services/theme_notifier.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _buildLogo() {
    return Image.asset(
      'assets/images/logoquiz.png',
      width: 96,
      height: 96,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: 96,
          height: 96,
          decoration: BoxDecoration(
            color: const Color(0xFF1877F2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(Icons.quiz_rounded, color: Colors.white, size: 48),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('QuickQuiz'),
        actions: [
          IconButton(
            tooltip: 'Changer le thème',
            icon: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
            onPressed: () {
              themeNotifier.value =
                  isDark ? ThemeMode.light : ThemeMode.dark;
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 24),
                _buildLogo(),
                const SizedBox(height: 20),
                const Text(
                  'QuickQuiz',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                Text(
                  'Teste ta culture générale : Géographie, '
                  'Histoire, Sciences, Arts et Cinéma.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).textTheme.bodySmall?.color,
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.play_arrow_rounded),
                    label: const Text('Commencer un quiz'),
                    onPressed: () => context.goNamed(AppRouter.quizList),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.add_circle_outline),
                    label: const Text('Ajouter une question'),
                    onPressed: () => context.goNamed(AppRouter.addQuestion),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}