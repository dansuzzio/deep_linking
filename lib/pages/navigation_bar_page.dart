import 'package:flutter/material.dart';

import '../states/navigation_bar_state.dart';

class NavigationBarPage extends StatelessWidget {
  final NavigationBarState state;

  const NavigationBarPage({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: state.selectedTabBody,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: state.selectedTabIndex,
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
        onTap: state.onTabSelected,
      ),
    );
  }
}
