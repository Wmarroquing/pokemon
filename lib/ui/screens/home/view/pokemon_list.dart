import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/ui/common/commons.dart';
import 'package:pokemon/ui/screens/home/home.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  final _pokemonScrollController = ScrollController();
  int _currentPage = 1;

  void _getMorePokemons() {
    if (_pokemonScrollController.position.pixels ==
        _pokemonScrollController.position.maxScrollExtent) {
      setState(() => _currentPage++);
      context.read<PokemonCubit>().getPokemonList(_currentPage);
    }
  }

  @override
  void initState() {
    _pokemonScrollController.addListener(_getMorePokemons);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final pokemonCubit = BlocProvider.of<PokemonCubit>(context);

    return BlocBuilder<PokemonCubit, PokeApiState>(
      builder: (context, state) {
        if (state is InitApi || state is Reconnecting){
          return const PokemonLoader();
        }
        if (state is ApiError){
          return PokemonError(title: state.errorMessage);
        }
        return ListView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 20
          ),
          controller: _pokemonScrollController,
          itemCount: pokemonCubit.pokemons.length + 1,
          itemBuilder: (context, index) {
            if(index < pokemonCubit.pokemons.length) {
              Results pokemon = pokemonCubit.pokemons[index];
              return PokemonCard(
                pokemonName: pokemon.name!, 
                infoEndPoint: pokemon.url!
              );
            } else {
              return const PokemonLoader();
            }
          }
        );
      },
    );
  }
}