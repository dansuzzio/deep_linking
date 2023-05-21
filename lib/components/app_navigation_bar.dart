import 'package:flutter/material.dart';

class AppNavigationBar extends StatelessWidget {
  final int selectedTabIndex;
  final Widget selectedTabBody;
  final void Function(int) onTabSelected;

  const AppNavigationBar({
    super.key,
    required this.selectedTabIndex,
    required this.selectedTabBody,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: selectedTabBody,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTabIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.topic),
            label: 'Topics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: onTabSelected,
      ),
    );
  }
}
