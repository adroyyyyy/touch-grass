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
}
