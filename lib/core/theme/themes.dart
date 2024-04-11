import 'package:apexive/core/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData defaultTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(10.0),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.white),
        borderRadius: BorderRadius.circular(10.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.white.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    useMaterial3: true,
    fontFamily: 'Inter',
    textTheme: const TextTheme(
        displaySmall: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 36,
          color: AppColors.white,
        ),
        headlineLarge: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 32,
          color: AppColors.white,
        ),
        headlineSmall: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
          color: AppColors.white,
        ),
        labelLarge: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: AppColors.white,
        ),
        titleMedium: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: AppColors.white,
        ),
        bodyMedium: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: AppColors.white,
        ),
        bodySmall: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 10,
          color: AppColors.white,
        )),
  );
}
