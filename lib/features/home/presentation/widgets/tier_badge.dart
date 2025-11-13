import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TierBadge extends StatelessWidget {
  final String label;
  final Color color;
  final bool isActive;

  const TierBadge({
    super.key,
    required this.label,
    required this.color,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: isActive ? color : color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: isActive ? Colors.white : color,
        ),
      ),
    );
  }
}
