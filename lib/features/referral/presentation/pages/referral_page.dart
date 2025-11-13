import 'package:flutter/material.dart';
import '../../../../core/theme/theme_extensions.dart';
import '../widgets/referral_header.dart';
import '../widgets/referral_text_field.dart';
import '../widgets/referral_question.dart';
import '../widgets/submit_button.dart';

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
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 64,
        ),
        content: const Text(
          'Tu amigo fue registrado exitosamente',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Cerrar dialog
              Navigator.pop(context); // Volver a home
            },
            child: const Text('OK'),
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

