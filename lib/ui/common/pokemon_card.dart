import 'package:flutter/material.dart';
import 'package:pokemon/config/theme/theme.dart';

class PokemonCard extends StatelessWidget {
  final String pokemonName;
  final String infoEndPoint;
  const PokemonCard({
    super.key,
    required this.pokemonName,
    required this.infoEndPoint
  });
  
  String _getPokemonId() => infoEndPoint.substring(34, infoEndPoint.length - 1);

  String _formatPokemonId() => _getPokemonId().padLeft(3,'0');

  String _getPokemonImage() {
    return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/${_getPokemonId()}.gif";
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Positioned(
            right: 10,
            bottom: -20,
            child: Text(
              '#${_formatPokemonId()}',
              style: TextStyle(
                fontSize: 50,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: whiteText.withOpacity(0.25)
              ),
            ),
          ),
          Image.asset(
            'assets/images/card_background.png',
            fit: BoxFit.fitHeight,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                FadeInImage.assetNetwork(
                  placeholder: 'assets/images/poke_loader.gif', 
                  image: _getPokemonImage(),
                  width: 50,
                  height: 50,
                ),
                Text(
                  pokemonName,
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}