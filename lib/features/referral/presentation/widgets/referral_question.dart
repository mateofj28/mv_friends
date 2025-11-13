import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/theme_extensions.dart';

class ReferralQuestion extends StatelessWidget {
  final String question;
  final bool value;
  final Function(bool) onChanged;

  const ReferralQuestion({
    super.key,
    required this.question,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: context.darkNavy,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _RadioOption(
              label: 'SÃƒÆ’Ã‚Â­',
              isSelected: value,
              onTap: () => onChanged(true),
            ),
            const SizedBox(width: 40),
            _RadioOption(
              label: 'No',
              isSelected: !value,
              onTap: () => onChanged(false),
            ),
          ],
        ),
      ],
    );
  }
}

class _RadioOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _RadioOption({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? context.primaryBlue : context.background,
              border: Border.all(
                color: isSelected
                    ? context.primaryBlue
                    : context.textSecondary,
                width: 2,
              ),
            ),
            child: isSelected
                ? Icon(
                    Icons.circle,
                    size: 12,
                    color: context.surface,
                  )
                : null,
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: context.darkNavy,
            ),
          ),
        ],
      ),
    );
  }
}
