import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/theme_extensions.dart';

class ReferralUserHeader extends StatelessWidget {
  final String userName;
  final String cedula;
  final String email;
  final String phone;
  final String referralDate;

  const ReferralUserHeader({
    super.key,
    required this.userName,
    required this.cedula,
    required this.email,
    required this.phone,
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
      child: Column(
        children: [
          Row(
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
            ],
          ),
          const SizedBox(height: 20),
          const Divider(height: 1),
          const SizedBox(height: 16),
          // Contact info
          _buildInfoRow(
            context,
            icon: Iconsax.card,
            label: 'Cedula',
            value: cedula,
          ),
          const SizedBox(height: 12),
          _buildInfoRow(
            context,
            icon: Iconsax.sms,
            label: 'Correo',
            value: email,
          ),
          const SizedBox(height: 12),
          _buildInfoRow(
            context,
            icon: Iconsax.call,
            label: 'Telefono',
            value: phone,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: context.primaryBlue.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            size: 18,
            color: context.primaryBlue,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  color: context.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: context.darkNavy,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
