import 'package:flutter/material.dart';
import 'package:preferencias_usuario/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routerName = 'Inicio';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(routerName)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('isDarkMode: '),
          Divider(),
          Text('Genero: '),
          Divider(),
          Text('Nombre de Usuario: '),
          Divider(),
        ],
      ),
      drawer: const SideMenu(),
    );
  }
}
