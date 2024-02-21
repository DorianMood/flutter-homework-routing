import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_drive/screens/authentification.dart';
import 'package:test_drive/screens/overlay_content.dart';

class HomeScreenArguments {
  final String name;
  final Roles role;

  HomeScreenArguments(this.name, this.role);
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as HomeScreenArguments;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Hello ${args.name}'),
            const SizedBox(height: 8),
            Text('I know, you\'re a ${args.role.name}'),
            const SizedBox(height: 8),
            CupertinoButton(
              child: const Text('Enter content overlay'),
              onPressed: () async {
                final content = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => const OverlayContentScreen(),
                  ),
                );

                OverlayEntry? overlayEntry;

                overlayEntry = OverlayEntry(builder: (builder) {
                  return Positioned(
                    top: 100,
                    left: 100,
                    child: Material(
                      child: SizedBox(
                        height: 100,
                        child: DecoratedBox(
                            decoration: const BoxDecoration(
                              color: Colors.red,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Text(content),
                                  const SizedBox(height: 8),
                                  CupertinoButton(
                                    child: const Text('Close'),
                                    onPressed: () {
                                      overlayEntry!.remove();
                                    },
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),
                  );
                });

                Overlay.of(context).insert(overlayEntry);
              },
            )
          ],
        ),
      ),
    );
  }
}
