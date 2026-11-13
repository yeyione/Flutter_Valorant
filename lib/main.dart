import 'package:flutter/material.dart';
import 'screens/lista_agentes_page.dart';
import 'theme/colores.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Valorant Agentes',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColoresValorant.rojo,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: ColoresValorant.fondo,
        appBarTheme: const AppBarTheme(
          backgroundColor: ColoresValorant.fondo,
          foregroundColor: ColoresValorant.blanco,
          centerTitle: true,
          elevation: 0,
        ),
      ),
      home: const ListaAgentesPage(),
    );
  }
}
