import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../apps/get_app.dart';
import 'settings_page.dart';
import 'topics_page.dart';

// class NavigationBarPage extends StatefulWidget {
//   const NavigationBarPage({super.key});

//   @override
//   State<NavigationBarPage> createState() => _NavigationBarPageState();
// }

// class _NavigationBarPageState extends State<NavigationBarPage> {
//   int _bottomBarIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(
//         index: _bottomBarIndex,
//         children: const [
//           TopicsPage(),
//           SettingsPage(),
//         ],
//       ),
//       // body: IndexedStack(
//       //   index: _bottomBarIndex,
//       //   children: [
//       //     topicsNavigator,
//       //     settingsNavigator,
//       //   ],
//       // ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _bottomBarIndex,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.topic),
//             label: 'Topics',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//         ],
//         onTap: (value) => setState(() => _bottomBarIndex = value),
//       ),
//     );
//   }
// }
// class NavigationBarPage extends StatelessWidget {
//   final int bottomBarIndex;
//   const NavigationBarPage({super.key, this.bottomBarIndex = 0});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(
//         index: bottomBarIndex,
//         children: const [
//           TopicsPage(),
//           SettingsPage(),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: bottomBarIndex,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.topic),
//             label: 'Topics',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//         ],
//         onTap: (value) => context.go(value == 1 ? '/settings' : '/topics'),
//       ),
//     );
//   }
// }

class NavigationBarPage extends StatelessWidget {
  final int bottomBarIndex;
  final Widget body;
  const NavigationBarPage({super.key, this.bottomBarIndex = 0, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomBarIndex,
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
        onTap: (value) => context.go(value == 1 ? '/settings' : '/topics'),
      ),
    );
  }
}
