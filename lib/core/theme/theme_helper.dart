import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_colors_dark.dart';

class ThemeHelper {
  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Color primaryBlue(BuildContext context) {
    return isDark(context) ? AppColorsDark.primaryBlue : AppColors.primaryBlue;
  }

  static Color primaryCyan(BuildContext context) {
    return isDark(context) ? AppColorsDark.primaryCyan : AppColors.primaryCyan;
  }

  static Color background(BuildContext context) {
    return isDark(context) ? AppColorsDark.background : AppColors.background;
  }

  static Color white(BuildContext context) {
    return isDark(context) ? AppColorsDark.white : AppColors.white;
  }

  static Color textPrimary(BuildContext context) {
    return isDark(context) ? AppColorsDark.textPrimary : AppColors.textPrimary;
  }

  static Color textSecondary(BuildContext context) {
    return isDark(context) ? AppColorsDark.textSecondary : AppColors.textSecondary;
  }

  static Color textLight(BuildContext context) {
    return isDark(context) ? AppColorsDark.textLight : AppColors.textLight;
  }

  static Color darkNavy(BuildContext context) {
    return isDark(context) ? AppColorsDark.darkNavy : AppColors.darkNavy;
  }
}
