import 'package:arm_fight_helper/src/colors.dart';
import 'package:flutter/material.dart';

// Usage
// Theme:
// Theme.of(context).color

//
// Extention:
// Theme.of(context).extension<ThemeColors>!().neededColor



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
        onSurface: DarkThemeColors.inactiveRound
    ),
    extensions: <ThemeExtension<dynamic>>[
      ThemeColors.dark,
    ],
    brightness: Brightness.dark,
    scaffoldBackgroundColor: DarkThemeColors.background,
    focusColor: Colors.blue.withOpacity(0.2),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: DarkThemeColors.textColor, fontWeight: FontWeight.w700, fontSize: 45),
      headlineMedium: TextStyle(color: DarkThemeColors.textColor, fontWeight: FontWeight.w700),
      bodyMedium: TextStyle(color: DarkThemeColors.textColor),
      bodyLarge: TextStyle(color: DarkThemeColors.textColor),
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
  final Color readyColor;
  final Color goColor;

  static get light => ThemeColors(
      mainMenuButtonColor: const Color(0xffFF3434),
      readyColor: LightThemeColors.ready,
      goColor: LightThemeColors.go
  );
  static get dark => ThemeColors(
      mainMenuButtonColor: const Color(0xffFF3434),
      readyColor: DarkThemeColors.ready,
      goColor: DarkThemeColors.go
  );

  ThemeColors({
    required this.mainMenuButtonColor,
    required this.readyColor,
    required this.goColor
  });

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? mainMenuButtonColor,
    Color? readyColor,
    Color? goColor
  }) {
    return ThemeColors(
      mainMenuButtonColor: mainMenuButtonColor ?? this.mainMenuButtonColor,
      readyColor: readyColor ?? this.readyColor,
      goColor: goColor ?? this.goColor
    );
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
      readyColor: Color.lerp(readyColor, other.readyColor, t)!,
      goColor: Color.lerp(goColor, other.goColor, t)!,
    );
  }
}