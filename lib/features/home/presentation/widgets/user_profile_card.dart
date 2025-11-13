import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/theme_extensions.dart';
import '../../../../core/auth/data/datasources/user_storage.dart';
import '../../../../core/di/injection.dart';
import 'tier_badge.dart';

class UserProfileCard extends StatefulWidget {
  const UserProfileCard({super.key});

  @override
  State<UserProfileCard> createState() => _UserProfileCardState();
}

class _UserProfileCardState extends State<UserProfileCard> {
  String _userName = 'Usuario';

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final userStorage = getIt<UserStorage>();
    final user = await userStorage.getUser();
    if (user != null && mounted) {
      setState(() {
        _userName = user.nombre;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.background,
              border: Border.all(
                color: context.primaryBlue.withValues(alpha: 0.2),
                width: 2,
              ),
            ),
            child: Icon(
              Iconsax.user,
              size: 32,
              color: context.primaryBlue,
            ),
          ),
          const SizedBox(width: 16),
          // User info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _userName,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: context.darkNavy,
                  ),
                ),
                const SizedBox(height: 8),
                const TierBadge(
                  label: 'Oro',
                  color: AppColors.gold,
                  isActive: true,
                ),
              ],
            ),
          ),
          // Arrow
          Icon(
            Iconsax.arrow_right_3,
            color: context.textSecondary,
            size: 20,
          ),
        ],
      ),
    );
  }
}
