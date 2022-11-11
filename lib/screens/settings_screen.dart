import 'package:flutter/material.dart';
import 'package:preferencias_usuario/providers/providers.dart';
import 'package:preferencias_usuario/shared_preferences/preferences.dart';
import 'package:preferencias_usuario/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const String routerName = 'Configuración';

  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(SettingsScreen.routerName)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Ajustes',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
            ),
            const Divider(),
            SwitchListTile.adaptive(
                value: Preferences.isDarkmode,
                title: const Text('DarkMode'),
                onChanged: (bool value) {
                  final themeProvider =
                      Provider.of<Themeprovider>(context, listen: false);
                  Preferences.isDarkmode = value;
                  value
                      ? themeProvider.setDarkMode()
                      : themeProvider.setLightMode();

                  setState(() {});
                }),
            const SizedBox(
              height: 10,
            ),
            RadioListTile<int>(
                title: const Text('Masculino'),
                value: 1,
                groupValue: Preferences.gender,
                onChanged: (value) {
                  Preferences.gender = value ?? 1;
                  setState(() {});
                }),
            RadioListTile<int>(
                title: const Text('Femenino'),
                value: 2,
                groupValue: Preferences.gender,
                onChanged: (value) {
                  Preferences.gender = value ?? 2;
                  setState(() {});
                }),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                initialValue: Preferences.name,
                onChanged: (value) {
                  Preferences.name = value;
                  setState(() {});
                },
                decoration: const InputDecoration(
                    labelText: 'Usuario', helperText: 'Nombre de usuario'),
              ),
            )
          ],
        )),
      ),
      drawer: const SideMenu(),
    );
  }
}
