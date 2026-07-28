import 'package:flutter/material.dart';

class AppTheme {
  static const Color fbBlue = Color(0xFF1877F2);
  static const Color lightBg = Color(0xFFF0F2F5);
  static const Color lightCardBg = Colors.white;

  static const Color darkBg = Color(0xFF18191A);
  static const Color darkCardBg = Color(0xFF242526);

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightBg,
    colorScheme: ColorScheme.fromSeed(
      seedColor: fbBlue,
      primary: fbBlue,
      surface: lightCardBg,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: lightCardBg,
      foregroundColor: Colors.black87,
      elevation: 0,
    ),
    cardTheme: const CardThemeData( // <-- Utiliser CardThemeData
      color: lightCardBg,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkBg,
    colorScheme: ColorScheme.fromSeed(
      seedColor: fbBlue,
      primary: fbBlue,
      surface: darkCardBg,
      brightness: Brightness.dark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: darkCardBg,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    cardTheme: const CardThemeData( // <-- Utiliser CardThemeData
      color: darkCardBg,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
  );
}