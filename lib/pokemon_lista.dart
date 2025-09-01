import 'package:flutter/material.dart';
import 'pokemon_detalle.dart';

class PokemonListScreen extends StatelessWidget {
  final String username;

  PokemonListScreen({super.key, required this.username});

  // Lista hardcodeada de Pokémon
  final List<Map<String, String>> _pokemons = [
    {
      "name": "Ogerpon",
      "type": "Grass/Fire",
      "description":
          "Un Pokémon poderoso de tipo planta que el salame ese no supo tener, que se lo perdió, porque siempre es segundo o peor.",
      "image":
          "https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/1017_f3.png",
    },
    {
      "name": "Hydreigon",
      "type": "Dragon/Dark",
      "description":
          "Un dragón de tres cabezas conocido por su fuerza devastadora. Le muerde la cabeza a Shumai, pero con afecto.",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaQKjFWnWyOScqe3Ipxb3v5MmAikqYFipddw&s",
    },
    {
      "name": "Lucario",
      "type": "Fighting/Steel",
      "description":
          "Pokémon ágil que puede sentir auras y usar ataques de energía. También es carpintero. Y un toque furro ngl.",
      "image":
          "https://archives.bulbagarden.net/media/upload/thumb/0/08/Lucario_SSBU.png/1200px-Lucario_SSBU.png",
    },
    {
      "name": "Alolan Ninetales",
      "type": "Ice/Fairy",
      "description":
          "Elegante Pokémon de tipo hielo que tira Aurora Veil, con colas espectaculares y poderes mágicos.",
      "image":
          "https://e0.pxfuel.com/wallpapers/623/701/desktop-wallpaper-artstation-alola-ninetales-daniela-aviles-alolan-ninetales.jpg",
    },
    {
      "name": "Gliscor",
      "type": "Ground/Flying",
      "description":
          "Pokémon con alas de murciélago que planea por el aire y ataca con garras afiladas, que baila con espadas. Capaz tenga un mega.",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVqjzkwFbAX1PzFUm1cTf-_QG3vSilNVp9mA&s",
    },
    {
      "name": "Gengar",
      "type": "Ghost/Poison",
      "description":
          "Pokémon fantasma travieso que puede sentarse en canteritos, desaparecer, y aparecer a voluntad. Esta piola ngl",
      "image":
          "https://i.pinimg.com/564x/ba/2f/3c/ba2f3c671648fee47333333941fbcedb.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text('Bienvenido/a $username!!')),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: _pokemons.length,
        itemBuilder: (context, index) {
          final pokemon = _pokemons[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: CircleAvatar(
                radius: 24, // Esto es un estándar razonable para ListTile
                backgroundImage: NetworkImage(pokemon['image']!),
              ),
              title: Text(
                pokemon['name']!,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(pokemon['type']!, style: textTheme.bodyMedium),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PokemonDetailScreen(pokemon: pokemon),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
