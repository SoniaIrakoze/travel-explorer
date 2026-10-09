# Travel Explorer 🌍

## Présentation

Travel Explorer est une application mobile développée avec Flutter et Dart. Elle permet aux utilisateurs de découvrir des destinations touristiques, de consulter leurs détails et de remplir un formulaire de réservation.

## Fonctionnalités

- Affichage des destinations touristiques.
- Recherche par nom de destination ou par pays.
- Filtrage par catégorie : Nature, Plage, Ville et Aventure.
- Consultation des détails d'une destination.
- Formulaire de réservation avec validation des champs.
- Calcul du prix total selon le nombre de voyageurs.
- Navigation entre les écrans avec GoRouter.
- Choix du thème clair ou sombre.
- Interface adaptée aux différentes tailles d'écran.

## Technologies utilisées

- Flutter
- Dart
- GoRouter
- Material Design 3
- Tests automatisés avec Flutter Test

## Prérequis

- Flutter installé.
- Dart installé avec Flutter.
- Un navigateur compatible ou un émulateur configuré.

## Installation et lancement

1. Cloner le dépôt GitHub.
2. Ouvrir un terminal dans le dossier du projet.
3. Installer les dépendances :

   ```bash
   flutter pub get
   ```

4. Lancer l'application dans Chrome :

   ```bash
   flutter run -d chrome
   ```

## Tests et analyse

Exécuter les tests :

```bash
flutter test
```

Analyser le code :

```bash
flutter analyze
```

## Structure du projet

- `lib/models/` : modèles de données.
- `lib/data/` : données des destinations.
- `lib/screens/` : écrans de l'application.
- `lib/widgets/` : widgets réutilisables.
- `lib/router/` : configuration de la navigation.
- `lib/theme/` : thèmes clair et sombre.
- `test/` : tests automatisés.

## Remarque

Ce projet est une démonstration pédagogique. Les réservations ne sont pas envoyées à un serveur et ne sont pas enregistrées dans une base de données.

## Auteur

Projet réalisé dans le cadre d'une certification Flutter.
