import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 2),
              Text(
                'TOUCH GRASS',
                textAlign: TextAlign.center,
                style: AppText.h0.copyWith(color: AppColors.primary),
              ),
              const Spacer(flex: 5),
              _PrimaryButton(
                label: 'GET STARTED',
                onPressed: () {
                  // TODO: go to the signup screen
                },
              ),
              const SizedBox(height: 16),
              _SecondaryButton(
                label: 'I HAVE AN ACCOUNT',
                onPressed: () {
                  // TODO: go to the login screen
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Filled green button with a darker bottom edge.
class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.only(bottom: 4),
      child: Material(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onPressed,
          child: SizedBox(
            height: 56,
            child: Center(
              child: Text(
                label,
                style: AppText.button.copyWith(color: AppColors.onPrimary),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Dark button with green text.
class _SecondaryButton extends StatelessWidget {
  const _SecondaryButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: AppColors.border, width: 2),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onPressed,
        child: SizedBox(
          height: 56,
          child: Center(
            child: Text(
              label,
              style: AppText.button.copyWith(color: AppColors.primary),
            ),
          ),
        ),
      ),
    );
  }
}
