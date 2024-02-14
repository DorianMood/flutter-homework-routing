import 'package:flutter/material.dart';
import 'package:test_drive/screens/authentification.dart';

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
            Text('I know, you\'re a ${args.role.name}'),
          ],
        ),
      ),
    );
  }
}
