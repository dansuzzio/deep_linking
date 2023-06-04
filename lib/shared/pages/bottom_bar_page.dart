import 'package:flutter/material.dart';

class BottomBarPage extends StatelessWidget {
  final Widget selectedTabBody;
  final int selectedTabIndex;
  final void Function(int) onTabSelected;

  const BottomBarPage({
    super.key,
    required this.selectedTabBody,
    required this.selectedTabIndex,
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
