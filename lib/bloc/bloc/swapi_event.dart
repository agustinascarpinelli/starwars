part of 'swapi_bloc.dart';

class SwapiEvent {}

class OnGetSpecies extends SwapiEvent {}

class OnGetPlanet extends SwapiEvent {}

class OnChangeConnectivity extends SwapiEvent {
  final bool connect;

  OnChangeConnectivity(this.connect);
}
