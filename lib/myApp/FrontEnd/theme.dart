import 'package:flutter/material.dart';

class ThemeClass {
  static ThemeData tema() {
    return ThemeData(
      primaryColor: const Color(0xFF1E3A8A), 
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1E3A8A), // Biru tua untuk AppBar
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          backgroundColor: const Color(0xFF1E3A8A), // Biru tua
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.normal,
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFFB5915F), // Warna emas
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xFF1E3A8A), // Biru tua
          side: const BorderSide(color: Color(0xFF1E3A8A)),
        ),
      ),

      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Color(0xFF1E3A8A)), // Biru tua
        headlineMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Color(0xFF1E3A8A)),
        headlineSmall: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Color(0xFF1E3A8A)),
        bodyMedium: TextStyle(fontSize: 14.0, color: Color(0xFF4B5563)), // Abu-abu gelap
        bodyLarge: TextStyle(fontSize: 16.0, color: Color(0xFF4B5563)),
        bodySmall: TextStyle(fontSize: 12.0, color: Color(0xFF4B5563)),
      ),

      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Color(0xFF1E3A8A)), // Biru tua
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFB5915F), width: 2.0), // Emas
        ),
        hintStyle: TextStyle(color: Color(0xFF4B5563)), // Abu-abu gelap
      ),

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF1E3A8A), // Biru tua
        foregroundColor: Colors.white,
        elevation: 6,
      ),

      cardTheme: const CardTheme(
        elevation: 3,
        color: Color(0xFFF8F9FA), // Warna latar abu-abu terang
      ),
    );
  }
}
