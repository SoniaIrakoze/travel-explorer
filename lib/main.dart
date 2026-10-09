
import 'package:flutter/material.dart';

import 'router/app_router.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const TravelExplorerApp());
}

class TravelExplorerApp extends StatefulWidget {
  const TravelExplorerApp({super.key});

  @override
  State<TravelExplorerApp> createState() => _TravelExplorerAppState();
}

class _TravelExplorerAppState extends State<TravelExplorerApp> {
  late final ValueNotifier<ThemeMode> _themeModeNotifier;
  late final router = createAppRouter(_themeModeNotifier);

  @override
  void initState() {
    super.initState();
    _themeModeNotifier = ValueNotifier<ThemeMode>(ThemeMode.system);
  }

  @override
  void dispose() {
    router.dispose();
    _themeModeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _themeModeNotifier,
      builder: (context, themeMode, child) {
        return MaterialApp.router(
          title: 'Travel Explorer',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeMode,
          routerConfig: router,
        );
      },
    );
  }
}
