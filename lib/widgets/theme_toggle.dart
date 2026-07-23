import 'package:flutter/material.dart';
import '../services/theme_notifier.dart';

/// Bouton de basculement de thème avec animation et icône adaptative.
/// Permet de passer entre le mode clair et sombre de l'application.
class ThemeToggle extends StatelessWidget {
  final bool showLabel;
  final String? lightLabel;
  final String? darkLabel;

  const ThemeToggle({
    super.key,
    this.showLabel = false,
    this.lightLabel,
    this.darkLabel,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, currentMode, _) {
        final currentIsDark = currentMode == ThemeMode.dark;
        
        return IconButton(
          tooltip: currentIsDark ? 'Passer en mode clair' : 'Passer en mode sombre',
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Icon(
              currentIsDark ? Icons.dark_mode : Icons.light_mode,
              key: ValueKey(currentIsDark),
            ),
          ),
          onPressed: () {
            themeNotifier.value = currentIsDark ? ThemeMode.light : ThemeMode.dark;
          },
        );
      },
    );
  }
}

/// Version bouton du ThemeToggle avec label et style plus élaboré.
class ThemeToggleButton extends StatelessWidget {
  final String? lightLabel;
  final String? darkLabel;

  const ThemeToggleButton({
    super.key,
    this.lightLabel,
    this.darkLabel,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, currentMode, _) {
        final currentIsDark = currentMode == ThemeMode.dark;
        
        return OutlinedButton.icon(
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Icon(
              currentIsDark ? Icons.dark_mode : Icons.light_mode,
              key: ValueKey(currentIsDark),
            ),
          ),
          label: Text(
            currentIsDark 
                ? (darkLabel ?? 'Mode sombre') 
                : (lightLabel ?? 'Mode clair'),
          ),
          onPressed: () {
            themeNotifier.value = currentIsDark ? ThemeMode.light : ThemeMode.dark;
          },
        );
      },
    );
  }
}
