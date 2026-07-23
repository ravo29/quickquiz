import 'package:flutter/material.dart';
import 'router/app_router.dart';
import 'services/theme_notifier.dart';

void main() {
  runApp(const QuickQuizApp());
}

class QuickQuizApp extends StatelessWidget {
  const QuickQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, currentMode, _) {
        return MaterialApp.router(
          title: 'QuickQuiz',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: currentMode,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}