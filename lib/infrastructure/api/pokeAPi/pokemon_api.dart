import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon/domain/models/pokemons/pokemon_gateway.dart';
import 'package:pokemon/infrastructure/api/pokeAPi/api_error/pokemon_api_error.dart';
import 'package:pokemon/ui/screens/home/models/pokemon.dart';

class PokemonAPI extends PokemonGateway {
  @override
  Future<Pokemons> getAllPokemons({required int page, int limit=20}) async {
    int offet = limit*(page-1);

    final response = await http.get(
      Uri.parse('https://pokeapi.co/api/v2/pokemon/?offset=$offet&limit=$limit')
    ).timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      return Pokemons.fromJson(jsonDecode(response.body));
    } else {
      throw ApiException();
    }
  }
  
}