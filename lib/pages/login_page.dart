import 'package:flutter/material.dart';

import '../states/login_page_state.dart';

class LoginPage extends StatelessWidget {
  final LoginPageState state;

  const LoginPage({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(
          // onPressed: state.login,
          onPressed: () => state.login(context),
          child: const Text('Login'),
        ),
      ),
    );
  }
}
