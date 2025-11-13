import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_colors_dark.dart';

/// Extension methods para acceder a colores del tema de forma limpia
/// Uso: context.primaryBlue en lugar de ThemeHelper.primaryBlue(context)
extension ThemeExtensions on BuildContext {
  /// Verifica si el tema actual es oscuro
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  /// Acceso al ColorScheme actual
  ColorScheme get colors => Theme.of(this).colorScheme;

  /// Acceso al TextTheme actual
  TextTheme get textTheme => Theme.of(this).textTheme;

  // Colores principales
  Color get primaryBlue => isDarkMode ? AppColorsDark.primaryBlue : AppColors.primaryBlue;
  Color get primaryCyan => isDarkMode ? AppColorsDark.primaryCyan : AppColors.primaryCyan;
  Color get lightCyan => isDarkMode ? AppColorsDark.lightCyan : AppColors.lightCyan;
  Color get darkNavy => isDarkMode ? AppColorsDark.darkNavy : AppColors.darkNavy;
  Color get cardBlue => isDarkMode ? AppColorsDark.cardBlue : AppColors.cardBlue;

  // Colores de acento (no cambian con el tema)
  Color get orange => AppColors.orange;
  Color get bronze => AppColors.bronze;
  Color get silver => AppColors.silver;
  Color get gold => AppColors.gold;

  // Colores de texto
  Color get textPrimary => isDarkMode ? AppColorsDark.textPrimary : AppColors.textPrimary;
  Color get textSecondary => isDarkMode ? AppColorsDark.textSecondary : AppColors.textSecondary;
  Color get textLight => isDarkMode ? AppColorsDark.textLight : AppColors.textLight;
  Color get textWhite => AppColors.textWhite;

  // Colores de fondo
  Color get background => isDarkMode ? AppColorsDark.background : AppColors.background;
  Color get surface => isDarkMode ? AppColorsDark.white : AppColors.white;

  // Colores de botones
  Color get buttonPrimary => isDarkMode ? AppColorsDark.buttonPrimary : AppColors.buttonPrimary;
  Color get buttonSecondary => isDarkMode ? AppColorsDark.buttonSecondary : AppColors.buttonSecondary;
}

/// Extension para acceder a colores desde ColorScheme de forma semántica
extension ColorSchemeExtensions on ColorScheme {
  /// Color principal de la app (azul)
  Color get primaryBlue => primary;
  
  /// Color secundario (cyan)
  Color get primaryCyan => secondary;
  
  /// Color de superficie/tarjetas
  Color get cardSurface => surface;
  
  /// Color de fondo
  Color get appBackground => surface;
}
