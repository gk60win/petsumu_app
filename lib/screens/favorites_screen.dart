import 'package:flutter/material.dart';
import '../models/property.dart';
import '../services/favorites_service.dart';
import '../widgets/property_card.dart';
import 'property_detail_screen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Property> _favoriteProperties = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() {
    final favoriteIds = FavoritesService.getFavoriteIds();
    final allProperties = Property.getDummyProperties();
    setState(() {
      _favoriteProperties = allProperties.where((p) => favoriteIds.contains(p.id)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('お気に入り')),
      body: _favoriteProperties.isEmpty
          ? const Center(child: Text('お気に入りがありません'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _favoriteProperties.length,
              itemBuilder: (context, index) {
                final property = _favoriteProperties[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: PropertyCard(
                    property: property,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PropertyDetailScreen(property: property)),
                      ).then((_) => _loadFavorites());
                    },
                  ),
                );
              },
            ),
    );
  }
}