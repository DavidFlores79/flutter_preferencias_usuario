import 'package:flutter/material.dart';
import 'package:preferencias_usuario/providers/providers.dart';
import 'package:preferencias_usuario/screens/screens.dart';
import 'package:preferencias_usuario/shared_preferences/preferences.dart';
import 'package:provider/provider.dart';

// void main() => runApp(const MyApp());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();

  // runApp(const MyApp());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) =>
              Themeprovider(isDarkmode: Preferences.isDarkmode),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias de Usuario',
      initialRoute: HomeScreen.routerName,
      routes: {
        HomeScreen.routerName: (_) => const HomeScreen(),
        SettingsScreen.routerName: (_) => const SettingsScreen(),
      },
      theme: Provider.of<Themeprovider>(context).currentTheme,
    );
  }
}
