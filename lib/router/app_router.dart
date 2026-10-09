
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/destinations.dart';
import '../screens/booking_screen.dart';
import '../screens/destinations_screen.dart';
import '../screens/detail_screen.dart';
import '../screens/home_screen.dart';
import '../screens/settings_screen.dart';

GoRouter createAppRouter(
  ValueNotifier<ThemeMode> themeModeNotifier,
) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/destinations',
        name: 'destinations',
        builder: (context, state) {
          return DestinationsScreen(
            onDestinationSelected: (id) {
              context.push('/destinations/$id');
            },
          );
        },
      ),
      GoRoute(
        path: '/destinations/:id',
        name: 'destination-detail',
        builder: (context, state) {
          final id = state.pathParameters['id']!;

          final destination = destinations.firstWhere(
            (item) => item.id == id,
          );

          return DetailScreen(
            destination: destination,
            onBook: () {
              context.push('/booking/$id');
            },
          );
        },
      ),
      GoRoute(
        path: '/booking/:id',
        name: 'booking',
        builder: (context, state) {
          final id = state.pathParameters['id']!;

          final destination = destinations.firstWhere(
            (item) => item.id == id,
          );

          return BookingScreen(
            destination: destination,
          );
        },
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) {
          return ValueListenableBuilder<ThemeMode>(
            valueListenable: themeModeNotifier,
            builder: (context, themeMode, child) {
              return SettingsScreen(
                themeMode: themeMode,
                onThemeChanged: (mode) {
                  themeModeNotifier.value = mode;
                },
              );
            },
          );
        },
      ),
    ],
  );
}
