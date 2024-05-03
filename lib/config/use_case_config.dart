import 'package:pokemon/domain/use_cases/pokemons/pokemon_use_case.dart';
import 'package:pokemon/infrastructure/api/pokeAPi/pokemon_api.dart';

class UseCaseConfig {

  GetPokemonsUseCase? getPokemonsUseCase;
  PokemonAPI? pokemonAPI;

  UseCaseConfig() {
    pokemonAPI = PokemonAPI();
    getPokemonsUseCase = GetPokemonsUseCase(pokemonAPI!);
  }

}