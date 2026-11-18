import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:touch_grass/main.dart';

void main() {
  setUpAll(() {
    // Don't download fonts during tests.
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  testWidgets('Starting screen shows title and both buttons', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('TOUCH GRASS'), findsOneWidget);
    expect(find.text('GET STARTED'), findsOneWidget);
    expect(find.text('I HAVE AN ACCOUNT'), findsOneWidget);
  });

  testWidgets('GET STARTED opens onboarding, Skip opens sign-in',
      (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('GET STARTED'));
    await tester.pumpAndSettle();
    expect(find.text('Reach the top rank by exploring more'), findsOneWidget);

    await tester.tap(find.text('Skip'));
    await tester.pumpAndSettle();
    expect(find.text('Welcome'), findsOneWidget);
    expect(find.text('SIGN IN'), findsOneWidget);
  });

  testWidgets('I HAVE AN ACCOUNT opens sign-in', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('I HAVE AN ACCOUNT'));
    await tester.pumpAndSettle();
    expect(find.text('Welcome Back'), findsOneWidget);
    expect(find.text('Username or Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
  });
}
