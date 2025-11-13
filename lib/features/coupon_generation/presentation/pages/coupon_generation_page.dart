import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/theme_extensions.dart';
import '../../../../core/utils/currency_input_formatter.dart';
import '../widgets/coupon_display.dart';

class CouponGenerationPage extends StatefulWidget {
  final String brandName;

  const CouponGenerationPage({
    super.key,
    required this.brandName,
  });

  @override
  State<CouponGenerationPage> createState() => _CouponGenerationPageState();
}

class _CouponGenerationPageState extends State<CouponGenerationPage> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  bool _isLoading = false;
  bool _couponGenerated = false;
  String? _generatedCouponCode;
  String? _errorMessage;

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  String? _validateAmount(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa un monto';
    }

    final amount = int.tryParse(value.replaceAll('.', '').replaceAll(',', ''));
    if (amount == null) {
      return 'Ingresa un valor numÃ©rico vÃ¡lido';
    }

    if (amount < 2000) {
      return 'El monto mÃ­nimo es \$2.000';
    }

    if (amount > 3000000) {
      return 'El monto mÃ¡ximo es \$3.000.000';
    }

    return null;
  }

  Future<void> _generateCoupon() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // Simular llamada a API
      await Future.delayed(const Duration(seconds: 2));

      // Generar cÃ³digo de cupÃ³n aleatorio
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final couponCode = 'CPN${timestamp.toString().substring(7)}';

      setState(() {
        _couponGenerated = true;
        _generatedCouponCode = couponCode;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Error al generar el cupÃ³n. Intenta nuevamente.';
      });
    }
  }

  void _resetForm() {
    setState(() {
      _couponGenerated = false;
      _generatedCouponCode = null;
      _errorMessage = null;
      _amountController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: _couponGenerated
                  ? CouponDisplay(
                      brandName: widget.brandName,
                      couponCode: _generatedCouponCode!,
                      amount: _amountController.text,
                      onGenerateNew: _resetForm,
                    )
                  : _buildForm(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: context.surface,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: context.primaryBlue),
            onPressed: () => Navigator.of(context).pop(),
          ),
          Expanded(
            child: Text(
              'Generar CupÃ³n',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: context.primaryBlue,
              ),
            ),
          ),
          Image.asset(
            'assets/images/logo.png',
            height: 40,
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildBrandInfo(),
            const SizedBox(height: 32),
            _buildAmountField(),
            const SizedBox(height: 24),
            if (_errorMessage != null) ...[
              _buildErrorMessage(),
              const SizedBox(height: 24),
            ],
            _buildGenerateButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildBrandInfo() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: context.background,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              'assets/images/brands/${widget.brandName}.png',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            widget.brandName.toUpperCase(),
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: context.darkNavy,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmountField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Monto del cupÃ³n',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: context.darkNavy,
          ),
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: _amountController,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CurrencyInputFormatter(),
          ],
          validator: _validateAmount,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: context.darkNavy,
          ),
          decoration: InputDecoration(
            hintText: '0',
            hintStyle: GoogleFonts.poppins(
              fontSize: 18,
              color: context.textLight,
            ),
            prefixText: '\$ ',
            prefixStyle: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: context.darkNavy,
            ),
            helperText: 'Monto entre \$2.000 y \$3.000.000',
            helperStyle: GoogleFonts.poppins(
              fontSize: 13,
              color: context.textSecondary,
            ),
            filled: true,
            fillColor: context.surface,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: context.background,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: context.primaryBlue,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 18,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorMessage() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.red.shade200,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.red.shade700,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              _errorMessage!,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.red.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenerateButton() {
    return ElevatedButton(
      onPressed: _isLoading ? null : _generateCoupon,
      style: ElevatedButton.styleFrom(
        backgroundColor: context.primaryBlue,
        foregroundColor: AppColors.white,
        padding: const EdgeInsets.symmetric(vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
        disabledBackgroundColor: context.textLight,
      ),
      child: _isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
              ),
            )
          : Text(
              'Obtener cupÃ³n',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
    );
  }
}
