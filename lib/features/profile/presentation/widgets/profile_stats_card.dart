import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/theme_extensions.dart';
import '../../../referral/data/providers/referral_provider.dart';

class ProfileStatsCard extends StatelessWidget {
  const ProfileStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final referralProvider = context.watch<ReferralProvider>();
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Estadisticas de usuario',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: context.darkNavy,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  value: '${referralProvider.totalReferrals}',
                  label: 'Total de\nreferidos',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  value: '${referralProvider.successfulReferrals}',
                  label: 'Referidos\nexitosos',
                ),
              ),              
            ],
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;

  const _StatCard({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: context.primaryBlue.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: context.primaryBlue,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: context.primaryBlue,
            ),
          ),
        ],
      ),
    );
  }
}
