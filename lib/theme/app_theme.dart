import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Colors from the Figma design.
class AppColors {
  static const Color pageBg = Color(0xFF0D120E);
  static const Color primary = Color(0xFF6FA23A);
  static const Color primaryDark = Color(0xFF4E7A27); // button bottom edge
  static const Color
    
    
    
    
    surface = Color(0xFF121812); // secondary button fill
  static const Color border = Color(0xFF1C241C);
  static const Color onPrimary = Color(0xFF0D120E);

  // Text
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textMuted = Color(0xFF9AA29A); // hints, small links
  static const Color textDisabled = Color(0xFF5A615A); // Skip, disabled button

  // Input fields
  static const Color fieldFill = Color(0xFF141A15);
  static const Color fieldBorder = Color(0xFF243024);

  // Disabled button / inactive progress bar
  static const Color disabledFill = Color(0xFF1A1F1A);

  // Google / Apple buttons
  static const Color socialFill = Color(0xFF1E201E);
}

/// Text styles from the Figma design (size / line height 145%).
/// Font: Nunito.
class AppText {
  static TextStyle _font(double size, FontWeight weight,
          {double letterSpacingPercent = 0}) =>
      GoogleFonts.nunito(
        fontSize: size,
        fontWeight: weight,
        height: 1.45,
        letterSpacing: size * letterSpacingPercent / 100,
      );

  // H0: Nunito Black 36, line height 145%, letter spacing -2%
  static TextStyle get h0 =>
      _font(36, FontWeight.w900, letterSpacingPercent: -2);

  // Screen titles ("Welcome", "Welcome Back"): Nunito Bold 36, -2%
  static TextStyle get title =>
      _font(36, FontWeight.w700, letterSpacingPercent: -2);

  // Big buttons: Nunito ExtraBold 20
  static TextStyle get button => _font(20, FontWeight.w800);

  // "Sign in with" part of the Google/Apple buttons: Nunito Bold 20
  static TextStyle get buttonLight => _font(20, FontWeight.w700);

  // Text inside input boxes: Nunito Bold 16, -2%
  static TextStyle get input =>
      _font(16, FontWeight.w700, letterSpacingPercent: -2);
  static TextStyle get h1 => _font(28, FontWeight.w800);
  static TextStyle get h2 => _font(20, FontWeight.w700);
  static TextStyle get body => _font(16, FontWeight.w600);
  // Labels (e.g. "Forgot Password?"): Nunito Bold 14
  static TextStyle get labels => _font(14, FontWeight.w700);
}

ThemeData buildAppTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.pageBg,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
      primary: AppColors.primary,
      surface: AppColors.pageBg,
    ),
    textTheme: GoogleFonts.nunitoTextTheme(ThemeData.dark().textTheme),
  );
}
