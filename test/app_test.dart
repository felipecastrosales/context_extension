import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:context_ext/app.dart';
import 'package:context_ext/home_page.dart';

void main() {
  testWidgets('Should renders App', (WidgetTester tester) async {
    await tester.pumpWidget(
      const App(),
    );

    expect(
      find.byType(App),
      findsOneWidget,
    );

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is MaterialApp &&
            widget.title == 'Context Extension' &&
            widget.home is HomePage,
      ),
      findsOneWidget,
    );
  });
}
