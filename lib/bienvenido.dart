import 'package:flutter/material.dart';

class BienvenidoScreen extends StatelessWidget {
  final String username;

  const BienvenidoScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bienvenido')),
      body: Center(
        child: Text(
          'Bienvenido/a $username',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
