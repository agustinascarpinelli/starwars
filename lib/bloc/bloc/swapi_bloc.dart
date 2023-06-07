import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:star_wars/models/planets_model.dart';
import 'package:star_wars/services/swapi_service.dart';
import 'package:path_provider/path_provider.dart';
import '../../models/species_model.dart';

part 'swapi_event.dart';
part 'swapi_state.dart';

class SwapiBloc extends HydratedBloc<SwapiEvent, SwapiState> {
  SwapiBloc() : super(SwapiState(isConnected: false)) {
    on<OnGetSpecies>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      if (state.isConnected) {
        final Either<String, List<Species>> species =
            await SwapiService().getSpecies();

        await species
            .fold((l) async => emit(state.copyWith(error: l, isLoading: false)),
                (r) async {
          final speciesWithPlanet = await getPlanet(r);
          emit(state.copyWith(
              species: speciesWithPlanet, isLoading: false, error: "no error"));
        });
      } else if (state.species != null) {
        emit(state.copyWith(
            isLoading: false, species: state.species, error: "no error"));
      } else {
        emit(state.copyWith(
            isLoading: false,
            error: 'Please connect to the internet for the first time'));
      }
    });

    on<OnChangeConnectivity>((event, emit) async {
      emit(state.copyWith(isConnected: event.connect));
    });
  }

  Future<List<Species>> getPlanet(List<Species> species) async {
    List<Future<Species>> updatedSpeciesFutures =
        species.map<Future<Species>>((element) async {
      if (element.homeworld != null) {
        final url = element.homeworld!;
        final Either<String, PlanetResponse> planet =
            await SwapiService().getPlanet(url);
        return planet.fold(
          (l) => element.copyWith(homeworld: 'Not Found'),
          (r) => element.copyWith(homeworld: r.name),
        );
      } else {
        return element.copyWith(homeworld: 'Not found');
      }
    }).toList();

    List<Species> updatedSpeciesList = await Future.wait(updatedSpeciesFutures);

    return updatedSpeciesList;
  }

  @override
  SwapiState? fromJson(Map<String, dynamic> json) {
    try {
      return SwapiState.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(SwapiState state) {
    try {
      return state.toJson();
    } catch (_) {
      return null;
    }
  }
}
