import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/ui/screens/home/home.dart';

class PokemonError extends StatelessWidget {
  final String title;
  const PokemonError({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 200,
        left: 31,
        right: 31
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const Text('please try again later...'),
          Expanded(
            child: Center(
              child: FilledButton(
                onPressed: () {
                  BlocProvider.of<PokemonCubit>(context).reconecting();
                  BlocProvider.of<PokemonCubit>(context).getPokemonList(1);
                }, 
                child: const Text('Try again now')
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/pikachu.png',
              fit: BoxFit.contain,
            )
          )
        ],
      ),
    );
  }
}
