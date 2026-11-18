import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/app_buttons.dart';
import '../widgets/app_text_field.dart';

// (opened by Skip on onboarding).
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _username = TextEditingController();
  final _password = TextEditingController();

  // SIGN IN stays grey until both boxes have text.
  bool get _canSignIn =>
      _username.text.trim().isNotEmpty && _password.text.isNotEmpty;

  void _signIn() {
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
        // LayoutBuilder + IntrinsicHeight: Google/Apple sit at the bottom,
        // but the page can still scroll when the keyboard is open.
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
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
                        'Welcome',
                        textAlign: TextAlign.center,
                        style: AppText.title
                            .copyWith(color: AppColors.textPrimary),
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
                            style: AppText.labels
                                .copyWith(color: AppColors.textMuted),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      PrimaryButton(
                        label: 'SIGN IN',
                        onPressed: _canSignIn ? _signIn : null,
                      ),
                      const Spacer(),
                      const SizedBox(height: 32),
                      _SocialButton(
                        brand: 'Google',
                        onPressed: () {
                          // TODO: sign in with Google
                        },
                      ),
                      const SizedBox(height: 16),
                      _SocialButton(
                        brand: 'Apple',
                        onPressed: () {
                          // TODO: sign in with Apple
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// "Sign in with **Google**" button: "Sign in with" is Bold 20,
/// the brand name is ExtraBold 20.
class _SocialButton extends StatelessWidget {
  const _SocialButton({required this.brand, required this.onPressed});

  final String brand;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.socialFill,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onPressed,
        child: SizedBox(
          height: 56,
          child: Center(
            child: Text.rich(
              TextSpan(
                style: AppText.buttonLight
                    .copyWith(color: AppColors.textPrimary),
                children: [
                  const TextSpan(text: 'Sign in with '),
                  TextSpan(text: brand, style: AppText.button),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
