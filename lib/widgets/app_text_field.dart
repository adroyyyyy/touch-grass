import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Dark rounded input box from the Figma design.
/// Set [isPassword] to true to hide the text and show the eye icon.
class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.hint,
    this.controller,
    this.isPassword = false,
    this.keyboardType,
    this.onChanged,
  });

  final String hint;
  final TextEditingController? controller;
  final bool isPassword;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _hidden = true;

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border(Color color) => OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: color, width: 2),
        );

    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword && _hidden,
      style: AppText.input.copyWith(color: AppColors.textPrimary),
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: AppText.input.copyWith(color: AppColors.textMuted),
        filled: true,
        fillColor: AppColors.fieldFill,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        enabledBorder: border(AppColors.fieldBorder),
        focusedBorder: border(AppColors.primary),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () => setState(() => _hidden = !_hidden),
                icon: Icon(
                  _hidden
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: AppColors.textMuted,
                  size: 20,
                ),
              )
            : null,
      ),
    );
  }
}
