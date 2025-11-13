import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/theme_extensions.dart';

class TierRequirements extends StatelessWidget {
  const TierRequirements({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(24),
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
          // Gold badge
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: context.gold.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '\$',
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: context.gold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'GOLD',
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: context.gold,
            ),
          ),
          const SizedBox(height: 16),
          _RequirementItem(
            tier: 'Bronze:',
            requirement: '1 referido efectivo',
          ),
          const SizedBox(height: 8),
          _RequirementItem(
            tier: 'Plata:',
            requirement: '2-3 referidos efectivos',
          ),
          const SizedBox(height: 8),
          _RequirementItem(
            tier: 'Oro:',
            requirement: '4-5 referidos efectivos',
          ),
        ],
      ),
    );
  }
}

class _RequirementItem extends StatelessWidget {
  final String tier;
  final String requirement;

  const _RequirementItem({
    required this.tier,
    required this.requirement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          tier,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: context.darkNavy,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          requirement,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: context.primaryBlue,
          ),
        ),
      ],
    );
  }
}
