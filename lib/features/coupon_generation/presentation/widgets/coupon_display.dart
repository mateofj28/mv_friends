import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:barcode_widget/barcode_widget.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/theme_extensions.dart';

class CouponDisplay extends StatelessWidget {
  final String brandName;
  final String couponCode;
  final String amount;
  final VoidCallback onGenerateNew;

  const CouponDisplay({
    super.key,
    required this.brandName,
    required this.couponCode,
    required this.amount,
    required this.onGenerateNew,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildSuccessMessage(),
          const SizedBox(height: 24),
          _buildCouponCard(context),
          const SizedBox(height: 24),
          _buildNewCouponButton(context),
        ],
      ),
    );
  }

  Widget _buildSuccessMessage() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.green.shade200,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cupon generado!',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.green.shade900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Tu cupon esta listo para usar',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.green.shade700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCouponCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildCouponHeader(context),
          const Divider(height: 1),
          _buildCouponBody(context),
        ],
      ),
    );
  }

  Widget _buildCouponHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: context.background,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              'assets/images/brands/$brandName.png',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            brandName.toUpperCase(),
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.darkNavy,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '\$$amount',
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryBlue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCouponBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          _buildQRCode(context),
          const SizedBox(height: 24),
          _buildCouponCode(context),
          const SizedBox(height: 24),
          _buildBarcode(context),
        ],
      ),
    );
  }

  Widget _buildQRCode(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.background,
          width: 2,
        ),
      ),
      child: QrImageView(
        data: couponCode,
        version: QrVersions.auto,
        size: 200,
        backgroundColor: context.surface,
      ),
    );
  }

  Widget _buildCouponCode(BuildContext context) {
    return Column(
      children: [
        Text(
          'Codigo del cupon',
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: context.textSecondary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: context.background,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            couponCode,
            style: GoogleFonts.robotoMono(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: context.darkNavy,
              letterSpacing: 2,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBarcode(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.background,
          width: 2,
        ),
      ),
      child: BarcodeWidget(
        barcode: Barcode.code128(),
        data: couponCode,
        width: 280,
        height: 80,
        drawText: false,
      ),
    );
  }



  Widget _buildNewCouponButton(BuildContext context) {
    return OutlinedButton(
      onPressed: onGenerateNew,
      style: OutlinedButton.styleFrom(
        foregroundColor: context.primaryBlue,
        side: BorderSide(
          color: context.primaryBlue,
          width: 2,
        ),
        padding: const EdgeInsets.symmetric(vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        'Generar nuevo cupon',
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
