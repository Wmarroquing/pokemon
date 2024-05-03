import 'package:flutter/material.dart';
import 'package:pokemon/config/theme/theme.dart';
import 'package:pokemon/ui/screens/home/home.dart';

class PokemonApp extends StatelessWidget {
  const PokemonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon App',
      theme: lightTheme,
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}