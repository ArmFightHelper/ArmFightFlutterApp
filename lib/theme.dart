import 'package:arm_fight_helper/src/colors.dart';
import 'package:flutter/material.dart';

// Usage
// Theme:
// Theme.of(context).color

//
// Extention:
// Theme.of(context).extension<ThemeColors>!.neededColor



ThemeData buildDarkTheme() {
  return ThemeData(
    colorScheme: const ColorScheme(
        primary: Colors.white,
        onPrimary: Colors.white,
        secondary: DarkThemeColors.timerProgress,
        onSecondary: Colors.white,
        brightness: Brightness.dark,
        error: Colors.redAccent,
        onError: Colors.white,
        surface: DarkThemeColors.timerProgress,
        onSurface: DarkThemeColors.timerProgress
    ),
    extensions: <ThemeExtension<dynamic>>[
      ThemeColors.dark,
    ],
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF222222),
    focusColor: Colors.blue.withOpacity(0.2),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
      bodyLarge: TextStyle(color: Colors.white),
    )
  );
}

ThemeData buildLightTheme() {
  return ThemeData(
      colorScheme: const ColorScheme(
          primary: LightThemeColors.textColor,
          onPrimary: LightThemeColors.inactiveRound,
          secondary: LightThemeColors.timerProgress,
          onSecondary: Colors.white,
          brightness: Brightness.light,
          error: Colors.redAccent,
          onError: Colors.white,
          surface: LightThemeColors.inactiveRound,
          onSurface: LightThemeColors.timerProgress
      ),
      extensions: <ThemeExtension<dynamic>>[
        ThemeColors.light,
      ],
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      focusColor: Colors.blue.withOpacity(0.2),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: LightThemeColors.textColor),
        bodyLarge: TextStyle(color: LightThemeColors.textColor),
      )
  );
}

class ThemeColors extends ThemeExtension<ThemeColors> {
  final Color mainMenuButtonColor;

  static get light => ThemeColors(mainMenuButtonColor: const Color(0xffFF3434));
  static get dark => ThemeColors(mainMenuButtonColor: const Color(0xffFF3434));

  ThemeColors({required this.mainMenuButtonColor});

  @override
  ThemeExtension<ThemeColors> copyWith({Color? mainMenuButtonColor}) {
    return ThemeColors(mainMenuButtonColor: mainMenuButtonColor ?? this.mainMenuButtonColor);
  }

  @override
  ThemeExtension<ThemeColors> lerp(
      covariant ThemeExtension<ThemeColors>? other,
      double t
      ) {
    if (other is! ThemeColors) {
      return this;
    }
    return ThemeColors(
      mainMenuButtonColor: Color.lerp(mainMenuButtonColor, other.mainMenuButtonColor, t)!,
    );
  }
}