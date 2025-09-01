import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatelessWidget {
  final Map<String, String> pokemon;

  const PokemonDetailScreen({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(pokemon['name']!)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.network(pokemon['image']!, fit: BoxFit.cover),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                pokemon['name']!,
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Text('Tipo: ${pokemon['type']}', style: textTheme.titleMedium),

            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                pokemon['description']!,
                style: textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
