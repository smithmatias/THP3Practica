import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  // Array hardcodeado de usuarios
  final List<Map<String, String>> _users = [
    {'user': 'user1', 'pass': '123'},
    {'user': 'user2', 'pass': '456'},
  ];

  void _login() {
    bool credencialesCorrectas = _users.any(
      (u) =>
          u['user'] == _userController.text &&
          u['pass'] == _passController.text,
    );

    if (credencialesCorrectas) {
      GoRouter.of(context).push('/bienvenido/${_userController.text}');
    } else {
      //Muestro un mensaje de snackbar informando lo que paso, dura unos segundos y se va
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Credenciales incorrectas')));
      //Tambien borro los campos para reintentar, por ejemplo
      _userController.clear();
      _passController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inicio de Sesion')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _userController,
              decoration: const InputDecoration(labelText: 'Usuario'),
            ),
            TextField(
              controller: _passController,
              decoration: const InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Iniciar Sesion'),
            ),
          ],
        ),
      ),
    );
  }
}
