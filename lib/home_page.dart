import 'package:context_ext/extensions/int_extension.dart';
import 'package:flutter/material.dart';
import 'package:context_ext/extensions/context_extension.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FocusNode specificFocusNode;

  @override
  void initState() {
    super.initState();
    specificFocusNode = FocusNode();
  }

  @override
  void dispose() {
    specificFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var args1 = ModalRoute.of(context)?.settings.arguments;
    var args2 = context.routeSettings?.arguments;
    var size = MediaQuery.sizeOf(context);

    debugPrint('args1: $args1');
    debugPrint('args2: $args2');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Context Extension'),
        centerTitle: true,
      ),
      drawer: const Drawer(),
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Column(
            children: [
              GridView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                children: [
                  Container(
                    width: size.width,
                    height: size.height,
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: const Text('mediaquery'),
                  ),
                  Container(
                    width: size.width,
                    height: size.height,
                    color: Colors.yellow,
                    alignment: Alignment.center,
                    child: const Text('size'),
                  ),
                  Container(
                    width: context.width,
                    height: context.height,
                    color: Colors.green,
                    alignment: Alignment.center,
                    child: const Text('context'),
                  ),
                ],
              ),
              GridView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pushNamed('/'),
                    child: const Text(
                      'navigator\n.of(context)',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextButton(
                    onPressed: () => context.pushNamed('/'),
                    child: const Text(
                      'navigator\ncontext',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    child: const Text(
                      'drawer\nscaffold',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextButton(
                    onPressed: () => context.openDrawer(),
                    child: const Text(
                      'drawer\ncontext',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    'Theme\n.of(context)',
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'theme\ncontext',
                    style: context.textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  Material(
                    child: InkWell(
                      onTap: () => Future.delayed(
                        const Duration(milliseconds: 16),
                        () => FocusScope.of(context)
                            .requestFocus(specificFocusNode),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'duration',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Material(
                    child: InkWell(
                      onTap: () => Future.delayed(
                        16.milliseconds,
                        () =>
                            context.focusScope.requestFocus(specificFocusNode),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'extension',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    autofocus: true,
                    focusNode: specificFocusNode,
                    decoration: const InputDecoration(
                      labelText: 'focus',
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).requestFocus(specificFocusNode);
                    },
                    child: const Text('FocusScope - Focus'),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      context.focusScope.requestFocus(specificFocusNode);
                    },
                    child: const Text('context - Focus'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
