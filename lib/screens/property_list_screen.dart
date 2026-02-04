import 'package:flutter/material.dart';
import '../models/property.dart';
import '../widgets/property_card.dart';
import 'property_detail_screen.dart';

class PropertyListScreen extends StatefulWidget {
  const PropertyListScreen({super.key});

  @override
  State<PropertyListScreen> createState() => _PropertyListScreenState();
}

class _PropertyListScreenState extends State<PropertyListScreen> {
  final List<Property> _properties = Property.getDummyProperties();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('検索結果')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _properties.length,
        itemBuilder: (context, index) {
          final property = _properties[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: PropertyCard(
              property: property,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PropertyDetailScreen(property: property)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}