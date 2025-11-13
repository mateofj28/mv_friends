import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/theme_extensions.dart';

class ReferralUserHeader extends StatelessWidget {
  final String userName;
  final String phone;
  final String email;
  final String referralDate;

  const ReferralUserHeader({
    super.key,
    required this.userName,
    required this.phone,
    required this.email,
    required this.referralDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
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
            width: 80,
            height: 80,
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
              size: 40,
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
                  userName,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: context.darkNavy,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Fecha de referencia: $referralDate',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: context.textSecondary,
                  ),
                ),
              ],
            ),
          ),
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
