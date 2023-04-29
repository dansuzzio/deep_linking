import 'package:flutter/material.dart';

import '../states/settings_page_state.dart';

class SettingsPage extends StatelessWidget {
  final SettingsPageState state;

  const SettingsPage({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Logout'),
            onTap: state.logout,
          ),
        ],
      ),
    );
  }
}
