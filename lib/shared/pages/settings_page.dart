import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  final void Function()? logout;

  const SettingsPage({super.key, required this.logout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Logout'),
            onTap: logout,
          ),
        ],
      ),
    );
  }
}
