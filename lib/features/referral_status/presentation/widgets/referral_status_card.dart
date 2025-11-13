import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/theme_extensions.dart';
import '../../../../core/utils/navigation_helper.dart';
import '../../../referral_detail/domain/models/referral_detail.dart';
import '../../../referral_detail/presentation/pages/referral_detail_page.dart';

class ReferralStatusCard extends StatelessWidget {
  final String userName;
  final String message;
  final String status;
  final Color statusColor;
  final double progress;
  final String? phone;
  final String? email;
  final String? referralDate;

  const ReferralStatusCard({
    super.key,
    required this.userName,
    required this.message,
    required this.status,
    required this.statusColor,
    required this.progress,
    this.phone,
    this.email,
    this.referralDate,
  });

  int _getStepFromStatus(String status) {
    switch (status) {
      case 'Sin Contactar':
        return 1;
      case 'Intentando Contactar':
        return 2;
      case 'Cotización':
        return 3;
      case 'Opcionado':
        return 4;
      case 'Cerrado Ganado':
        return 5;
      default:
        return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final referralDetail = ReferralDetail(
          userName: userName,
          phone: phone ?? '+57 300 123 4567',
          email: email ?? 'usuario@email.com',
          referralDate: referralDate ?? '01/01/2024',
          status: status,
          currentStep: _getStepFromStatus(status),
        );

        NavigationHelper.navigateWithSlideAnimation(
          context,
          ReferralDetailPage(referral: referralDetail),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.surface,
          borderRadius: BorderRadius.circular(12),
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
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.background,
            ),
            child: Icon(
              Icons.person,
              size: 32,
              color: context.textSecondary,
            ),
          ),
          const SizedBox(width: 16),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: context.darkNavy,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: context.textSecondary,
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: statusColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        status,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: context.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 8,
                    backgroundColor: context.background,
                    valueColor: AlwaysStoppedAnimation<Color>(statusColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }
}
