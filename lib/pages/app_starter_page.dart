import 'package:flutter/material.dart';

class AppStarterPage extends StatelessWidget {
  const AppStarterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      )
    );
  }
}