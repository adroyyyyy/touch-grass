import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/app_buttons.dart';
import 'sign_in_screen.dart';

/// Onboarding Screens 1–4: swipe or tap NEXT to move through them.
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  static const List<String> _pages = [
    'Reach the top rank by exploring more',
    'Turn your city into your playground',
    'Earn XP for real-world exploration',
    'Your all-in-one exploration companion is here.',
  ];

  final PageController _controller = PageController();
  int _current = 0;

  bool get _isLast => _current == _pages.length - 1;

  void _next() {
    if (_isLast) {
      _finish();
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  // Skip (and NEXT on the last page) go to the sign-in screen.
  // pushReplacement = the back button won't return to onboarding.
  void _finish() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const SignInScreen()),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _ProgressBar(count: _pages.length, current: _current),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: _pages.length,
                  onPageChanged: (i) => setState(() => _current = i),
                  itemBuilder: (context, i) => Padding(
                    padding: const EdgeInsets.fromLTRB(36, 110, 36, 0),
                    child: Text(
                      _pages[i],
                      style: AppText.h0.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              SecondaryButton(
                label: 'Skip',
                onPressed: _finish,
                textColor: AppColors.textDisabled,
                textStyle: AppText.body,
              ),
              const SizedBox(height: 12),
              PrimaryButton(label: 'NEXT', onPressed: _next),
            ],
          ),
        ),
      ),
    );
  }
}

/// The 4 little bars at the top; the current page's bar is green.
class _ProgressBar extends StatelessWidget {
  const _ProgressBar({required this.count, required this.current});

  final int count;
  final int current;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < count; i++) ...[
          if (i > 0) const SizedBox(width: 8),
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: 7,
              decoration: BoxDecoration(
                color: i == current ? AppColors.primary : AppColors.border,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
