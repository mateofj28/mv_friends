import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_colors_dark.dart';
import '../../../../core/theme/theme_provider.dart';

class ThemeSettingsPage extends StatelessWidget {
  const ThemeSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      backgroundColor: isDark ? AppColorsDark.background : AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context, isDark),
            Expanded(
              child: _buildContent(context, themeProvider, isDark),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: isDark ? AppColorsDark.white : AppColors.white,
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: isDark ? AppColorsDark.primaryBlue : AppColors.primaryBlue,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          Expanded(
            child: Text(
              'Apariencia',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: isDark ? AppColorsDark.primaryBlue : AppColors.primaryBlue,
              ),
            ),
          ),
          Image.asset(
            'assets/images/logo.png',
            height: 40,
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, ThemeProvider themeProvider, bool isDark) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tema de la aplicación',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isDark ? AppColorsDark.textPrimary : AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          _buildThemeOption(
            context: context,
            title: 'Claro',
            subtitle: 'Usa el tema claro',
            icon: Iconsax.sun_1,
            isSelected: themeProvider.themeMode == AppThemeMode.light,
            onTap: () => themeProvider.setThemeMode(AppThemeMode.light),
            isDark: isDark,
          ),
          const SizedBox(height: 12),
          _buildThemeOption(
            context: context,
            title: 'Oscuro',
            subtitle: 'Usa el tema oscuro',
            icon: Iconsax.moon,
            isSelected: themeProvider.themeMode == AppThemeMode.dark,
            onTap: () => themeProvider.setThemeMode(AppThemeMode.dark),
            isDark: isDark,
          ),
          const SizedBox(height: 12),
          _buildThemeOption(
            context: context,
            title: 'Sistema',
            subtitle: 'Usa la configuración del sistema',
            icon: Iconsax.mobile,
            isSelected: themeProvider.themeMode == AppThemeMode.system,
            onTap: () => themeProvider.setThemeMode(AppThemeMode.system),
            isDark: isDark,
          ),
        ],
      ),
    );
  }

  Widget _buildThemeOption({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? AppColorsDark.white : AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? (isDark ? AppColorsDark.primaryBlue : AppColors.primaryBlue)
                : (isDark ? AppColorsDark.white : AppColors.background),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected
                    ? (isDark ? AppColorsDark.primaryBlue : AppColors.primaryBlue)
                    : (isDark ? AppColorsDark.background : AppColors.background),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: isSelected
                    ? AppColors.white
                    : (isDark ? AppColorsDark.textSecondary : AppColors.textSecondary),
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isDark ? AppColorsDark.textPrimary : AppColors.darkNavy,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: isDark ? AppColorsDark.textSecondary : AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(
                Iconsax.tick_circle5,
                color: isDark ? AppColorsDark.primaryBlue : AppColors.primaryBlue,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}
