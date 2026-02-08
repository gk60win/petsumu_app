import 'package:flutter/material.dart';
import '../models/fudo.dart';

class FudoDetailScreen extends StatelessWidget {
  final Fudo fudo;

  const FudoDetailScreen({super.key, required this.fudo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(fudo.title)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (fudo.images.isNotEmpty)
            SizedBox(
              height: 240,
              child: PageView(
                children: fudo.images.map((url) {
                  return Image.network(url, fit: BoxFit.cover);
                }).toList(),
              ),
            ),

          const SizedBox(height: 16),

          Text(
            fudo.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            fudo.content.replaceAll(RegExp(r'<[^>]*>'), ''),
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
