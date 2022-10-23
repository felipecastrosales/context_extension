import 'package:flutter/material.dart';

import 'package:context_ext/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Context Extension',
      home: HomePage(),
    );
  }
}
