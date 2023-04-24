import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../repositories/user_repository.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Logout'),
            onTap: () async {
              final shouldLogout = await showModalBottomSheet<bool?>(
                context: context,
                builder: (context) => Column(
                  children: [
                    const SizedBox(height: 30),
                    const Text('Logout?'),
                    const SizedBox(height: 30),
                    OutlinedButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Yes')),
                    const SizedBox(height: 10),
                    OutlinedButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('No')),
                  ],
                ),
              );
              if (shouldLogout == true) {
                await UserRepository.logout();
                // if (context.mounted) Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
                if (context.mounted) Get.offAllNamed('/login');
              }
            },
          ),
        ],
      ),
    );
  }
}
