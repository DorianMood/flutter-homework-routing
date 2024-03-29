import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Intro page'),
            CupertinoButton(
              child: const Text('Authentificate'),
              onPressed: () {
                Navigator.pushNamed(context, '/authentification');
              },
            )
          ],
        ),
      ),
    );
  }
}
