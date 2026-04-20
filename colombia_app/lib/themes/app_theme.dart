import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFFFFCD00);
  static const Color secondary = Color(0xFF003087);
  static const Color accent = Color(0xFFCE1126);

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        primary: primary,
        secondary: secondary,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primary,
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
