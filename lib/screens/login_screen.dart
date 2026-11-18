import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/app_buttons.dart';
import '../widgets/app_text_field.dart';

/// "Log in dashboard" from Figma.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _username = TextEditingController();
  final _password = TextEditingController();

  // LOG IN stays grey until both boxes have text.
  bool get _canLogIn =>
      _username.text.trim().isNotEmpty && _password.text.isNotEmpty;

  void _logIn() {
    // TODO: check username/password and go to the home screen
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Back arrow (only shown if there is a screen to go back to)
              Align(
                alignment: Alignment.centerLeft,
                child: Navigator.canPop(context)
                    ? IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back,
                            color: AppColors.textMuted),
                      )
                    : const SizedBox(height: 48),
              ),
              const SizedBox(height: 56),
              Text(
                'Welcome Back',
                textAlign: TextAlign.center,
                style: AppText.title.copyWith(color: AppColors.textPrimary),
              ),
              const SizedBox(height: 24),
              AppTextField(
                hint: 'Username or Email',
                controller: _username,
                keyboardType: TextInputType.emailAddress,
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 16),
              AppTextField(
                hint: 'Password',
                controller: _password,
                isPassword: true,
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    // TODO: go to the forgot password screen
                  },
                  child: Text(
                    'Forgot Password?',
                    style: AppText.labels.copyWith(color: AppColors.textMuted),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              PrimaryButton(
                label: 'LOG IN',
                onPressed: _canLogIn ? _logIn : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
