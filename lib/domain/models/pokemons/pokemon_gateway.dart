import 'package:pokemon/ui/screens/home/home.dart';

abstract class PokemonGateway {
  Future<Pokemons> getAllPokemons({required int page, int limit=20});
}