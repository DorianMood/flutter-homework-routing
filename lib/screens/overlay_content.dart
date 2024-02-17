import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OverlayContentScreen extends StatefulWidget {
  const OverlayContentScreen({super.key});

  @override
  State<OverlayContentScreen> createState() => _OverlayContentScreenState();
}

class _OverlayContentScreenState extends State<OverlayContentScreen> {
  String? content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Overlay content page'),
            const SizedBox(height: 8),
            SizedBox(
              width: 200,
              child: TextField(
                decoration: const InputDecoration(
                  label: Text('Content'),
                ),
                onChanged: (value) {
                  setState(() {
                    content = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 8),
            CupertinoButton(
              child: const Text('Submit'),
              onPressed: () {
                if (content != null) {
                  Navigator.of(context).pop(content);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
