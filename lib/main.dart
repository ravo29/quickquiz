import 'package:flutter/material.dart';
import 'router/app_router.dart';
import 'themes/app_theme.dart';


void main() {
  runApp(const QuickQuizApp());
}

class QuickQuizApp extends StatelessWidget {
  const QuickQuizApp({super.key});

  @override
  Widget build(BuildContext  context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: AppRouter.themeModeNotifier,
      builder: (context, currentThemeMode, child) {
        return MaterialApp.router(
          title: 'QuickQuiz',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: currentThemeMode,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}