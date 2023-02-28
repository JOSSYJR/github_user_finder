import 'package:flutter/material.dart';

import 'constants/colors.dart';

class AppTheme{

  static ThemeData lightTheme() {
    return ThemeData(
      canvasColor: fullWhite,
      colorScheme: const ColorScheme(
        primary: primary,
        brightness: Brightness.light,
        onPrimary: darkBackgroundDark,
        secondary: secondary,
        onSecondary: fullWhite,
        error: Colors.red,
        onError: textColor,
        background: textColor,
        onBackground: secondairyLight,
        surface: textColor,
        onSurface: textColor,
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      canvasColor: darkBackgroundDark,
      colorScheme: const ColorScheme(
        primary: primary,
        brightness: Brightness.dark,
        onPrimary: darkBackgroundDark,
        secondary: secondary,
        onSecondary: textColor,
        error: Colors.red,
        onError: textColor,
        background: darkSurface,
        onBackground: darkBackgroundDark,
        surface: darkSurface,
        onSurface: textColor,
      ),
    );
  }

}

