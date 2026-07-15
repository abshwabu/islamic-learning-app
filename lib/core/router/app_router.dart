import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/derses/presentation/derses_screen.dart';
import '../../features/downloads/presentation/downloads_screen.dart';
import '../../features/favorites/presentation/favorites_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/player/presentation/player_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';

abstract final class AppRoutes {
  static const home = '/';
  static const derses = '/derses';
  static const player = '/player';
  static const downloads = '/downloads';
  static const favorites = '/favorites';
  static const settings = '/settings';
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.home,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => MainShell(child: child),
      routes: [
        GoRoute(
          path: AppRoutes.home,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HomeScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.derses,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: DersesScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.downloads,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: DownloadsScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.favorites,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: FavoritesScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.settings,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: SettingsScreen(),
          ),
        ),
      ],
    ),
    GoRoute(
      path: '${AppRoutes.player}/:id',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        final id = state.pathParameters['id'];
        return PlayerScreen(dersId: id);
      },
    ),
    GoRoute(
      path: AppRoutes.player,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const PlayerScreen(),
    ),
  ],
);

class MainShell extends StatelessWidget {
  const MainShell({super.key, required this.child});

  final Widget child;

  int _selectedIndex(String location) {
    if (location.startsWith(AppRoutes.derses)) return 1;
    if (location.startsWith(AppRoutes.downloads)) return 2;
    if (location.startsWith(AppRoutes.favorites)) return 3;
    if (location.startsWith(AppRoutes.settings)) return 4;
    return 0;
  }

  void _onDestinationSelected(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(AppRoutes.home);
      case 1:
        context.go(AppRoutes.derses);
      case 2:
        context.go(AppRoutes.downloads);
      case 3:
        context.go(AppRoutes.favorites);
      case 4:
        context.go(AppRoutes.settings);
    }
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final selectedIndex = _selectedIndex(location);

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) => _onDestinationSelected(context, index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book),
            label: 'Derses',
          ),
          NavigationDestination(
            icon: Icon(Icons.download_outlined),
            selectedIcon: Icon(Icons.download),
            label: 'Downloads',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
