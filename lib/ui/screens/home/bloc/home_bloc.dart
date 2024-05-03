import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/config/use_case_config.dart';
import 'package:pokemon/ui/screens/home/home.dart';

class PokemonCubit extends Cubit<PokeApiState> {
  PokemonCubit() : super(InitApi());

  UseCaseConfig caseConfig = UseCaseConfig();
  List<Results> pokemons = [];

  void reconecting() => emit(Reconnecting());

  Future<void> getPokemonList(int currentPage) async {
    try {
      Pokemons resp = await caseConfig.getPokemonsUseCase!.getAllPokemons(page: currentPage);
      if (resp.results != null) {
        pokemons = [...pokemons, ...resp.results!];
        emit(ApiSuccess()); 
      }
    } catch (error) {
      emit(ApiError(errorMessage: 'Something went wrong')); 
    }
  }

}

abstract class PokeApiState {}

class InitApi extends PokeApiState {}
class ApiSuccess extends PokeApiState {}
class Reconnecting extends PokeApiState {}

class ApiError extends PokeApiState {
  final String errorMessage;
  ApiError({required this.errorMessage});
}
