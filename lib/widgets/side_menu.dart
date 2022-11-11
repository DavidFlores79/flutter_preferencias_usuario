import 'package:flutter/material.dart';
import 'package:preferencias_usuario/screens/screens.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        const _DrawerHeader(),
        ListTile(
          leading: const Icon(Icons.pages_outlined),
          title: const Text(HomeScreen.routerName),
          onTap: () {
            Navigator.pushReplacementNamed(context, HomeScreen.routerName);
          },
        ),
        ListTile(
          leading: const Icon(Icons.people_outline),
          title: const Text('Personas'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.settings_outlined),
          title: const Text(SettingsScreen.routerName),
          onTap: () {
            Navigator.pushReplacementNamed(context, SettingsScreen.routerName);
          },
        ),
      ]),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/side-menu.png'), fit: BoxFit.cover)),
      child: Container(),
    );
  }
}
