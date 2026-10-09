import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:travel_explorer/main.dart';

void main() {
  testWidgets('L’application affiche la page d’accueil', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const TravelExplorerApp());

    expect(find.text('Travel Explorer'), findsOneWidget);
    expect(find.text('Le monde vous attend !'), findsOneWidget);
  });

  testWidgets('Le bouton permet d’ouvrir les destinations', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const TravelExplorerApp());

    await tester.tap(find.text('Explorer toutes les destinations'));
    await tester.pumpAndSettle();

    expect(find.text('Destinations'), findsOneWidget);
    expect(find.text('Explorer'), findsOneWidget);
  });

  testWidgets('Les paramètres sont accessibles depuis l’accueil', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const TravelExplorerApp());

    await tester.tap(find.byTooltip('Paramètres'));
    await tester.pumpAndSettle();

    expect(find.text('Paramètres'), findsOneWidget);
  });

  testWidgets('La recherche filtre les destinations par nom', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const TravelExplorerApp());

    await tester.tap(find.text('Explorer toutes les destinations'));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byType(TextField),
      'Zanzibar',
    );
    await tester.pumpAndSettle();

    expect(find.text('Zanzibar'), findsNWidgets(2));
    expect(find.text('Kigali'), findsNothing);
  });

  testWidgets('Le filtre Nature affiche les destinations de cette catégorie', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const TravelExplorerApp());

    await tester.tap(find.text('Explorer toutes les destinations'));
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(ChoiceChip, 'Nature'));
    await tester.pumpAndSettle();

    expect(find.text('Lac Tanganyika'), findsOneWidget);
    expect(find.text('Parc national de la Kibira'), findsOneWidget);
    expect(find.text('Zanzibar'), findsNothing);
  });

  testWidgets('Une recherche sans résultat affiche un message adapté', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const TravelExplorerApp());

    await tester.tap(find.text('Explorer toutes les destinations'));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byType(TextField),
      'DestinationInexistante123',
    );
    await tester.pumpAndSettle();

    expect(find.text('Aucune destination trouvée.'), findsOneWidget);
  });
}