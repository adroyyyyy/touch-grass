import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Big green button with a dark-green outline and thicker bottom edge.
/// Pass `onPressed: null` to show it greyed out (disabled).
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.label, required this.onPressed});

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;
    return Container(
      decoration: BoxDecoration(
        color: enabled ? AppColors.primaryDark : AppColors.border,
        borderRadius: BorderRadius.circular(14),
      ),
      // thin outline, thicker at the bottom (3D look)
      padding: const EdgeInsets.fromLTRB(2, 2, 2, 5),
      child: Material(
        color: enabled ? AppColors.primary : AppColors.disabledFill,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onPressed,
          child: SizedBox(
            height: 56,
            child: Center(
              child: Text(
                label,
                style: AppText.button.copyWith(
                  color: enabled ? AppColors.onPrimary : AppColors.textDisabled,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Dark button with a faint outline (e.g. "I HAVE AN ACCOUNT", "Skip").
class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.textColor = AppColors.primary,
    this.textStyle,
  });

  final String label;
  final VoidCallback? onPressed;
  final Color textColor;
  final TextStyle? textStyle;

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
              style: (textStyle ?? AppText.button).copyWith(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
