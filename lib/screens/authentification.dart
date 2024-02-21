import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_drive/screens/home.dart';

enum Roles { developer, designer, manager }

class AuthentificationScreen extends StatefulWidget {
  const AuthentificationScreen({super.key});

  @override
  State<AuthentificationScreen> createState() => _AuthentificationScreenState();
}

class _AuthentificationScreenState extends State<AuthentificationScreen> {
  String? name;
  Roles? role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Authentification page'),
            const SizedBox(height: 8),
            SizedBox(
              width: 200,
              child: TextField(
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 8),
            DropdownMenu(
              dropdownMenuEntries: const [
                DropdownMenuEntry(
                  value: Roles.developer,
                  label: 'Developer',
                ),
                DropdownMenuEntry(
                  value: Roles.designer,
                  label: 'Designer',
                ),
                DropdownMenuEntry(
                  value: Roles.manager,
                  label: 'Manager',
                ),
              ],
              onSelected: (selected) {
                setState(() {
                  role = selected;
                });
              },
            ),
            const SizedBox(height: 8),
            CupertinoButton(
              child: const Text('Home page'),
              onPressed: () {
                if (role != null && name != null) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false,
                      arguments: HomeScreenArguments(name!, role!));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
