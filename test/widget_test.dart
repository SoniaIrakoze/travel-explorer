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
}