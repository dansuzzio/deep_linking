import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final void Function()? login;

  const LoginPage({super.key, required this.login});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: login,
          child: const Text('Login'),
        ),
      ),
    );
  }
}
