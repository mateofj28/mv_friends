import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/di/injection.dart';
import '../../../login/presentation/bloc/login_bloc.dart';
import '../../../login/presentation/bloc/login_event.dart';
import '../../../login/presentation/bloc/login_state.dart';
import 'custom_text_field.dart';
import 'primary_button.dart';

class WelcomeForm extends StatefulWidget {
  const WelcomeForm({super.key});

  @override
  State<WelcomeForm> createState() => _WelcomeFormState();
}

class _WelcomeFormState extends State<WelcomeForm> {
  final _documentController = TextEditingController();
  final _tokenController = TextEditingController();
  late final LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = getIt<LoginBloc>();
  }

  @override
  void dispose() {
    _documentController.dispose();
    _tokenController.dispose();
    _loginBloc.close();
    super.dispose();
  }

  void _handleLogin() {
    final documento = _documentController.text.trim();
    if (documento.isEmpty) {
      _showErrorDialog('Por favor ingresa tu documento');
      return;
    }
    _loginBloc.add(LoginSubmitted(documento));
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showNotFriendDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Acceso Denegado'),
        content: const Text('Aún no eres amigo Marval'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: _loginBloc,
      listener: (context, state) {
        if (state is LoginSuccess) {
          context.go(AppRouter.home);
        } else if (state is LoginUserNotFound) {
          _showNotFriendDialog();
        } else if (state is LoginFailure) {
          _showErrorDialog(state.message);
        }
      },
      builder: (context, state) {
        final isLoading = state is LoginLoading;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              controller: _documentController,
              label: 'Ingresa Documento',
              hint: 'Cedula',
              icon: Iconsax.card,
              enabled: !isLoading,
              maxLength: 10,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            const SizedBox(height: 24),
            CustomTextField(
              controller: _tokenController,
              label: 'Token',
              hint: 'Token',
              icon: Iconsax.key,
              isPassword: true,
              enabled: !isLoading,
            ),
            const SizedBox(height: 40),
            PrimaryButton(
              text: isLoading ? 'Validando...' : 'Ingresar',
              onPressed: isLoading ? null : _handleLogin,
            ),
            if (isLoading) ...[
              const SizedBox(height: 20),
              const Center(
                child: CircularProgressIndicator(),
              ),
            ],
          ],
        );
      },
    );
  }
}
