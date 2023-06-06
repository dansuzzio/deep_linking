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
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedTabIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.topic),
            label: 'Topics',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onDestinationSelected: onTabSelected,
      ),
    );
  }
}
