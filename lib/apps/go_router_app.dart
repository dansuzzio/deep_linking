import 'package:flutter/material.dart';

class GoRouterApp extends StatelessWidget {
  const GoRouterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Deep Linking',
      // routerConfig: _router,
    );
  }
}

// final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
var currentTopicsRoute = '/topics';

// final _router = GoRouter(
//   navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'root'),
//   debugLogDiagnostics: true,
//   redirect: (context, state) => UserRepository.isLoggedIn ? null : '/login',
//   initialLocation: '/topics',
//   routes: [
//     ShellRoute(
//       navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'shell'),
//       builder: (context, state, child) => NavigationBarPage(
//         bottomBarIndex: state.location == '/settings' ? 1 : 0,
//         body: child,
//       ),
//       routes: [
//         GoRoute(
//           path: '/topics',
//           // redirect: (context, state) => currentTopicsRoute,
//           pageBuilder: (context, state) {
//             currentTopicsRoute = state.location;
//             return const NoTransitionPage(child: TopicsPage());
//           },
//           routes: [
//             GoRoute(
//               path: ':topic',
//               builder: (context, state) {
//                 currentTopicsRoute = state.location;
//                 return ArticleListPage(topic: state.params['topic']!);
//               },
//               routes: [
//                 GoRoute(
//                   path: ':article',
//                   builder: (context, state) {
//                     currentTopicsRoute = state.location;
//                     return ArticleDetailsPage(
//                       topic: state.params['topic']!,
//                       title: state.params['article']!,
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//         GoRoute(
//           path: '/settings',
//           pageBuilder: (context, state) => const NoTransitionPage(child: SettingsPage()),
//         ),
//       ],
//     ),
//     GoRoute(
//       path: '/login',
//       // builder: (_, __) => const LoginPage(),
//     ),
//   ],
// );
