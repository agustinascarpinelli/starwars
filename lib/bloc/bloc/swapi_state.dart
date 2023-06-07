part of 'swapi_bloc.dart';

class SwapiState {
  final List<Species>? species;
  final bool isConnected;
  final PlanetResponse? planet;
  final bool isLoading;
  final String? error;

  SwapiState(
      {this.planet,
      this.error = "no error",
      this.species,
      this.isConnected = false,
      this.isLoading = false});

  SwapiState copyWith({
    final bool? isConnected,
    final List<Species>? species,
    final bool? isLoading,
    final PlanetResponse? planet,
    final String? error,
  }) =>
      SwapiState(
          planet: planet ?? this.planet,
          error: error ?? this.error,
          isLoading: isLoading ?? this.isLoading,
          isConnected: isConnected ?? this.isConnected,
          species: species ?? this.species);

  SwapiState.fromJson(Map<String, dynamic> json)
      : species = (json['species'] as List<String>?)
            ?.map((e) => Species.fromJson(e as String))
            .toList(),
        isConnected = json['isConnected'] as bool? ?? false,
        planet = json['planet'] != null
            ? PlanetResponse.fromJson(json['planet'] as String)
            : null,
        isLoading = json['isLoading'] as bool? ?? false,
        error = json['error'] as String?;

  Map<String, dynamic> toJson() {
    return {
      'species': species?.map((e) => e.toJson()).toList(),
      'isConnected': false,
      'planet': planet?.toJson(),
      'isLoading': isLoading,
      'error': "no error",
    };
  }
}
