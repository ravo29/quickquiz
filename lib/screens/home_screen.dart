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
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    final isDesktop = screenWidth >= 900;

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
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 48 : isTablet ? 32 : 24,
              vertical: isDesktop ? 32 : 24,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isDesktop ? 600 : double.infinity,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: isDesktop ? 48 : 24),
                  _buildLogo(),
                  SizedBox(height: isDesktop ? 32 : 20),
                  Text(
                    'QuickQuiz',
                    style: TextStyle(
                      fontSize: isDesktop ? 32 : isTablet ? 28 : 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: isDesktop ? 16 : 8),
                  Text(
                    'Teste ta culture générale : Géographie, '
                    'Histoire, Sciences, Arts et Cinéma.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isDesktop ? 16 : isTablet ? 15 : 14,
                      color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
                  ),
                  SizedBox(height: isDesktop ? 48 : 32),
                  SizedBox(
                    width: double.infinity,
                    height: isDesktop ? 56 : isTablet ? 52 : 48,
                    child: ElevatedButton.icon(
                      icon: Icon(
                        Icons.play_arrow_rounded,
                        size: isDesktop ? 28 : 24,
                      ),
                      label: Text(
                        'Commencer un quiz',
                        style: TextStyle(
                          fontSize: isDesktop ? 18 : 16,
                        ),
                      ),
                      onPressed: () => context.goNamed(AppRouter.quizList),
                    ),
                  ),
                  SizedBox(height: isDesktop ? 16 : 12),
                  SizedBox(
                    width: double.infinity,
                    height: isDesktop ? 56 : isTablet ? 52 : 48,
                    child: OutlinedButton.icon(
                      icon: Icon(
                        Icons.add_circle_outline,
                        size: isDesktop ? 28 : 24,
                      ),
                      label: Text(
                        'Ajouter une question',
                        style: TextStyle(
                          fontSize: isDesktop ? 18 : 16,
                        ),
                      ),
                      onPressed: () => context.goNamed(AppRouter.addQuestion),
                    ),
                  ),
                  SizedBox(height: isDesktop ? 32 : 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}