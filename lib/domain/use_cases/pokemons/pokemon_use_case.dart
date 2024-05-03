import 'package:pokemon/domain/models/pokemons/pokemon_gateway.dart';
import 'package:pokemon/ui/screens/home/home.dart';

class GetPokemonsUseCase {
  
  final PokemonGateway _pokemonGateway;
  GetPokemonsUseCase(this._pokemonGateway);

  Future<Pokemons> getAllPokemons({required int page}) async {
    return _pokemonGateway.getAllPokemons(page: page);
  }
}