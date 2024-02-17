import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OverlayDisplay extends StatelessWidget {
  const OverlayDisplay({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
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
                  print('close');
                },
              )
            ],
          ),
        ));
  }
}
