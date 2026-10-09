
import 'package:flutter/material.dart';

import '../data/destinations.dart';
import '../widgets/destination_card.dart';
import '../widgets/search_field.dart';
import '../widgets/section_title.dart';

class DestinationsScreen extends StatefulWidget {
  final ValueChanged<String> onDestinationSelected;

  const DestinationsScreen({
    super.key,
    required this.onDestinationSelected,
  });

  @override
  State<DestinationsScreen> createState() => _DestinationsScreenState();
}

class _DestinationsScreenState extends State<DestinationsScreen> {
  final TextEditingController _searchController = TextEditingController();

  String _searchQuery = '';
  String _selectedCategory = 'Toutes';

  final List<String> _categories = const [
    'Toutes',
    'Nature',
    'Plage',
    'Ville',
    'Aventure',
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredDestinations = destinations.where((destination) {
      final query = _searchQuery.toLowerCase().trim();

      final matchesSearch =
          destination.name.toLowerCase().contains(query) ||
          destination.country.toLowerCase().contains(query);

      final matchesCategory = _selectedCategory == 'Toutes' ||
          destination.category == _selectedCategory;

      return matchesSearch && matchesCategory;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Destinations'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = constraints.maxWidth >= 700;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: SearchField(
                  controller: _searchController,
                  hintText: 'Rechercher une destination...',
                  onChanged: (value) {
                    setState(() => _searchQuery = value);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: SectionTitle(
                  title: 'Explorer',
                  subtitle:
                      '${filteredDestinations.length} destination(s) trouvée(s)',
                ),
              ),
              SizedBox(
                height: 48,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final category = _categories[index];

                    return ChoiceChip(
                      label: Text(category),
                      selected: category == _selectedCategory,
                      onSelected: (_) {
                        setState(() => _selectedCategory = category);
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: filteredDestinations.isEmpty
                    ? const Center(
                        child: Text('Aucune destination trouvée.'),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: filteredDestinations.length,
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isTablet ? 3 : 1,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          mainAxisExtent: 280,
                        ),
                        itemBuilder: (context, index) {
                          final destination = filteredDestinations[index];

                          return DestinationCard(
                            destination: destination,
                            onTap: () {
                              widget.onDestinationSelected(destination.id);
                            },
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
