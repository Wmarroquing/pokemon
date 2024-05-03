import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/ui/screens/home/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create:(context) => PokemonCubit()..getPokemonList(1),
        child: const PokemonList(),
      )
    );
  }
}