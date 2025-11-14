import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/theme_extensions.dart';

class FaqButton extends StatelessWidget {
  final String question;
  final VoidCallback onTap;

  const FaqButton({
    super.key,
    required this.question,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          foregroundColor: context.primaryBlue,
          side: BorderSide(
            color: context.primaryBlue.withValues(alpha: 0.3),
            width: 1.5,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                question,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: context.primaryBlue,
            ),
          ],
        ),
      ),
    );
  }
}
