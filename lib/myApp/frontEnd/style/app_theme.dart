import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryRed = Color(0xFFD32F2F);
  static const Color secondaryRed = Color(0xFFEF5350);
  static const Color surfaceWhite = Colors.white;
  static const Color backgroundWhite = Colors.white;
  static const Color errorRed = Color(0xFFE57373);
  static const Color onPrimaryColor = Colors.white;
  static const Color onSecondaryColor = Colors.white;
  static const Color onSurfaceColor = Colors.black87;
  static const Color onBackgroundColor = Colors.black;

  static ThemeData myTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: backgroundWhite,
    primarySwatch: Colors.red,
    colorScheme: const ColorScheme.light(
      primary: primaryRed,
      secondary: secondaryRed,
      surface: surfaceWhite,
      error: errorRed,
      onPrimary: onPrimaryColor,
      onSecondary: onSecondaryColor,
      onSurface: onSurfaceColor,
      onError: Colors.white,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: primaryRed,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: onPrimaryColor,
      ),
      iconTheme: IconThemeData(color: onPrimaryColor),
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16, color: onSurfaceColor),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.black54),
      titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: onSurfaceColor),
    ),

    cardTheme: CardTheme(
      color: surfaceWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 3,
      shadowColor: Colors.grey.withOpacity(0.2),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryRed,
        foregroundColor: onPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryRed,
      foregroundColor: onPrimaryColor,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: surfaceWhite,
      selectedItemColor: primaryRed,
      unselectedItemColor: Colors.black54,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),
  );
}
