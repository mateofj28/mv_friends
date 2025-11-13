import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'app_colors_dark.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.light(
      primary: AppColors.primaryBlue,
      onPrimary: AppColors.white,
      secondary: AppColors.primaryCyan,
      onSecondary: AppColors.white,
      tertiary: AppColors.lightCyan,
      error: Colors.red.shade700,
      onError: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.darkNavy,
      surfaceContainerHighest: AppColors.background,
      onSurfaceVariant: AppColors.textSecondary,
      outline: AppColors.textLight,
      shadow: Colors.black.withOpacity(0.1),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: colorScheme,
      textTheme: GoogleFonts.poppinsTextTheme(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonPrimary,
          foregroundColor: AppColors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.buttonSecondary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        hintStyle: GoogleFonts.poppins(
          color: AppColors.textLight,
          fontSize: 14,
        ),
        labelStyle: GoogleFonts.poppins(
          color: AppColors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    final colorScheme = ColorScheme.dark(
      primary: AppColorsDark.primaryBlue,
      onPrimary: AppColorsDark.white,
      secondary: AppColorsDark.primaryCyan,
      onSecondary: AppColorsDark.white,
      tertiary: AppColorsDark.lightCyan,
      error: Colors.red.shade400,
      onError: AppColorsDark.white,
      surface: AppColorsDark.white,
      onSurface: AppColorsDark.textPrimary,
      surfaceContainerHighest: AppColorsDark.cardBlue,
      onSurfaceVariant: AppColorsDark.textSecondary,
      outline: AppColorsDark.textLight,
      shadow: Colors.black.withOpacity(0.3),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColorsDark.background,
      colorScheme: colorScheme,
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColorsDark.buttonPrimary,
          foregroundColor: AppColorsDark.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColorsDark.buttonSecondary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        hintStyle: GoogleFonts.poppins(
          color: AppColorsDark.textLight,
          fontSize: 14,
        ),
        labelStyle: GoogleFonts.poppins(
          color: AppColorsDark.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
