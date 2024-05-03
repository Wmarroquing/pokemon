import 'package:flutter/material.dart';

class PokemonLoader extends StatelessWidget {
  const PokemonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/loading.gif',
            height: 71,
          ),
          const Text('Loading...')
        ],
      ),
    );
  }
}