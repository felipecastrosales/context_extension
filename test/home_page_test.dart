import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:context_ext/home_page.dart';

void main() {
  testWidgets('Should renders HomePage', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    expect(
      find.byType(HomePage),
      findsOneWidget,
    );

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Scaffold &&
            widget.appBar is AppBar &&
            widget.drawer is Drawer &&
            widget.body is SingleChildScrollView,
      ),
      findsOneWidget,
    );

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is AppBar &&
            widget.title is Text &&
            widget.centerTitle == true,
      ),
      findsOneWidget,
    );

    expect(
      find.byWidgetPredicate(
        (widget) => widget is Text && widget.data == 'Context Extension',
      ),
      findsOneWidget,
    );

    expect(
      find.byWidgetPredicate(
        (widget) => widget is SingleChildScrollView && widget.child is Column,
      ),
      findsOneWidget,
    );

    expect(
      find.byWidgetPredicate(
          (widget) => widget is Column && widget.children.isNotEmpty),
      findsNWidgets(2),
    );

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is GridView &&
            widget.physics is NeverScrollableScrollPhysics &&
            widget.shrinkWrap == true &&
            widget.gridDelegate is SliverGridDelegateWithFixedCrossAxisCount,
      ),
      findsNWidgets(2),
    );

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Container &&
            widget.alignment == Alignment.center &&
            widget.child is Text,
      ),
      findsNWidgets(5),
    );

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Text &&
            widget.data != null &&
            widget.textAlign == TextAlign.center,
      ),
      findsNWidgets(8),
    );

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is TextButton &&
            widget.onPressed is VoidCallback &&
            widget.child is Text,
      ),
      findsNWidgets(4),
    );

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is TextField &&
            widget.decoration is InputDecoration &&
            widget.focusNode is FocusNode &&
            widget.autofocus == true,
      ),
      findsOneWidget,
    );

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is ElevatedButton &&
            widget.onPressed is VoidCallback &&
            widget.child is Text,
      ),
      findsNWidgets(2),
    );

        expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is InkWell &&
            widget.onTap is VoidCallback &&
            widget.child is Container,
      ),
      findsNWidgets(2),
    );
  });
}
