import 'package:flutter/material.dart';

import 'user_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Login'),
          onPressed: () {
            User.isLoggedIn = true;
            Navigator.of(context).pushNamed('/topics');
          },
        ),
      ),
    );
  }
}
