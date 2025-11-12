import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/auth/data/datasources/user_storage.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.dart';
import '../pages/terms_conditions_page.dart';
import 'profile_title.dart';
import 'profile_header.dart';
import 'profile_stats_card.dart';
import 'profile_menu_item.dart';
import 'section_title.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  Future<void> _handleLogout(BuildContext context) async {
    // Mostrar diálogo de confirmación
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cerrar sesión'),
        content: const Text('¿Estás seguro que deseas cerrar sesión?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Cerrar sesión'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      // Limpiar datos del usuario
      final userStorage = getIt<UserStorage>();
      await userStorage.clearUser();
      
      // Navegar a welcome
      if (context.mounted) {
        context.go(AppRouter.welcome);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileTitle(),
          const ProfileHeader(),
          const SizedBox(height: 24),
          const ProfileStatsCard(),
          const SizedBox(height: 24),
          const SectionTitle(title: 'Configuración de cuenta'),
          ProfileMenuItem(
            icon: Iconsax.document_text,
            title: 'Términos y condiciones',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TermsConditionsPage(),
                ),
              );
            },
          ),
          ProfileMenuItem(
            icon: Iconsax.logout,
            title: 'Cerrar sesión',
            onTap: () => _handleLogout(context),
            showDivider: false,
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

