import 'package:flutter/material.dart';

import 'constants/colors.dart';

class AppTheme{

  static ThemeData lightTheme() {
    return ThemeData(
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
        surface: fullWhite,
        onSurface: textColor,
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
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
        surface: darkbackgroundText,
        onSurface: textColor,
      ),
    );
  }

}

