import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/theme_extensions.dart';
import '../widgets/referral_header.dart';
import '../widgets/referral_text_field.dart';
import '../widgets/referral_question.dart';
import '../widgets/submit_button.dart';
import '../../domain/models/referral.dart';
import '../../data/providers/referral_provider.dart';

class ReferralPage extends StatefulWidget {
  const ReferralPage({super.key});

  @override
  State<ReferralPage> createState() => _ReferralPageState();
}

class _ReferralPageState extends State<ReferralPage> {
  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  bool _wantsCarolinaAttention = false;

  @override
  void dispose() {
    _nameController.dispose();
    _idController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _submitReferral() {
    // Validar que los campos no esten vacios
    if (_nameController.text.trim().isEmpty ||
        _idController.text.trim().isEmpty ||
        _emailController.text.trim().isEmpty ||
        _phoneController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Por favor completa todos los campos',
            style: GoogleFonts.poppins(),
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Crear el referido
    final referral = Referral(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: _nameController.text.trim(),
      cedula: _idController.text.trim(),
      email: _emailController.text.trim(),
      phone: _phoneController.text.trim(),
      status: 'Sin Contactar',
      message: 'Gracias por registrar a ${_nameController.text.trim()}',
      createdAt: DateTime.now(),
    );

    // Guardar en el provider
    context.read<ReferralProvider>().addReferral(referral);

    // Mostrar dialog de exito
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 64,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Referido registrado exitosamente',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.background,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    referral.name,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: context.primaryBlue,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildInfoRow('Cedula', referral.cedula),
                  _buildInfoRow('Email', referral.email),
                  _buildInfoRow('Telefono', referral.phone),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Estado: ${referral.status}',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Cerrar dialog
              Navigator.pop(context); // Volver a home
            },
            child: Text(
              'OK',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: context.textSecondary,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: context.darkNavy,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ReferralHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    ReferralTextField(
                      controller: _nameController,
                      hint: 'Nombre completo',
                      keyboardType: TextInputType.name,
                    ),
                    ReferralTextField(
                      controller: _idController,
                      hint: 'Numero de cedula',
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                    ),
                    ReferralTextField(
                      controller: _emailController,
                      hint: 'Correo electronico',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    ReferralTextField(
                      controller: _phoneController,
                      hint: 'Telefono',
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                    ),
                    const SizedBox(height: 20),
                    ReferralQuestion(
                      question:
                          'A ti te atendio Carolina. Deseas que tambien atienda a tu amigo?',
                      value: _wantsCarolinaAttention,
                      onChanged: (value) {
                        setState(() {
                          _wantsCarolinaAttention = value;
                        });
                      },
                    ),
                    const SizedBox(height: 40),
                    SubmitButton(
                      text: 'Enviar referido',
                      onPressed: _submitReferral,
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

