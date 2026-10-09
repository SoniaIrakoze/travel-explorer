
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeChanged;

  const SettingsScreen({
    super.key,
    required this.themeMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Apparence',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 12),
          Card(
            child: RadioGroup<ThemeMode>(
              groupValue: themeMode,
              onChanged: (value) {
                if (value != null) {
                  onThemeChanged(value);
                }
              },
              child: const Column(
                children: [
                  RadioListTile<ThemeMode>(
                    value: ThemeMode.light,
                    secondary: Icon(Icons.light_mode_outlined),
                    title: Text('Thème clair'),
                    subtitle: Text('Une interface lumineuse'),
                  ),
                  Divider(height: 1),
                  RadioListTile<ThemeMode>(
                    value: ThemeMode.dark,
                    secondary: Icon(Icons.dark_mode_outlined),
                    title: Text('Thème sombre'),
                    subtitle: Text(
                      'Une interface adaptée aux environnements sombres',
                    ),
                  ),
                  Divider(height: 1),
                  RadioListTile<ThemeMode>(
                    value: ThemeMode.system,
                    secondary: Icon(Icons.settings_suggest_outlined),
                    title: Text('Automatique'),
                    subtitle: Text(
                      'Suivre les réglages de votre appareil',
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'À propos',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 12),
          const Card(
            child: ListTile(
              leading: Icon(Icons.travel_explore),
              title: Text('Travel Explorer'),
              subtitle: Text(
                'Découvrez votre prochaine destination.',
              ),
              trailing: Text('v1.0.0'),
            ),
          ),
        ],
      ),
    );
  }
}
