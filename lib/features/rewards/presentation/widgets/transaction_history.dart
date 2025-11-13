import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/theme_extensions.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Historial de transacciones',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: context.darkNavy,
            ),
          ),
          const SizedBox(height: 16),
          _TransactionItem(
            tier: '\$1',
            count: '',
            label: 'Silla Exito',
          ),
          const SizedBox(height: 12),
          _TransactionItem(
            tier: '\$15.000',
            count: '',
            label: 'Compra Makro',
          ),
          const SizedBox(height: 12),
          _TransactionItem(
            tier: '\$20.000',
            count: '',
            label: 'Daviplata',
          ),
          const SizedBox(height: 12),
          _TransactionItem(
            tier: '\$20.000',
            count: '',
            label: 'Falabella',
          ),
        ],
      ),
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final String tier;
  final String count;
  final String label;

  const _TransactionItem({
    required this.tier,
    required this.count,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Iconsax.tick_circle5, color: context.primaryBlue,
          size: 20,
        ),
        const SizedBox(width: 12),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '$tier ',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: context.darkNavy,
                ),
              ),
              TextSpan(
                text: count,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: context.primaryBlue,
                ),
              ),
              TextSpan(
                text: ' $label',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: context.primaryBlue,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
