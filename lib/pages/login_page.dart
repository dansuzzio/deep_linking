import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../repositories/user_repository.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Login'),
          onPressed: () async {
            await UserRepository.login();
            // Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
            // Get.offAllNamed('/home');
            if (context.mounted) context.go('/topics');
          },
        ),
      ),
    );
  }
}
