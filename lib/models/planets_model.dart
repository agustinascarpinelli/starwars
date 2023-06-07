// To parse this JSON data, do
//
//     final planetResponse = planetResponseFromMap(jsonString);

import 'dart:convert';

class PlanetResponse {
    String? name;
    String? rotationPeriod;
    String? orbitalPeriod;
    String? diameter;
    String? climate;
    String? gravity;
    String? terrain;
    String? surfaceWater;
    String? population;
    List<String>? residents;
    List<String>? films;
    DateTime? created;
    DateTime? edited;
    String? url;

    PlanetResponse({
        this.name,
        this.rotationPeriod,
        this.orbitalPeriod,
        this.diameter,
        this.climate,
        this.gravity,
        this.terrain,
        this.surfaceWater,
        this.population,
        this.residents,
        this.films,
        this.created,
        this.edited,
        this.url,
    });

    factory PlanetResponse.fromJson(String str) => PlanetResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PlanetResponse.fromMap(Map<String, dynamic> json) => PlanetResponse(
        name: json["name"],
        rotationPeriod: json["rotation_period"],
        orbitalPeriod: json["orbital_period"],
        diameter: json["diameter"],
        climate: json["climate"],
        gravity: json["gravity"],
        terrain: json["terrain"],
        surfaceWater: json["surface_water"],
        population: json["population"],
        residents: json["residents"] == null ? [] : List<String>.from(json["residents"]!.map((x) => x)),
        films: json["films"] == null ? [] : List<String>.from(json["films"]!.map((x) => x)),
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
        edited: json["edited"] == null ? null : DateTime.parse(json["edited"]),
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "rotation_period": rotationPeriod,
        "orbital_period": orbitalPeriod,
        "diameter": diameter,
        "climate": climate,
        "gravity": gravity,
        "terrain": terrain,
        "surface_water": surfaceWater,
        "population": population,
        "residents": residents == null ? [] : List<dynamic>.from(residents!.map((x) => x)),
        "films": films == null ? [] : List<dynamic>.from(films!.map((x) => x)),
        "created": created?.toIso8601String(),
        "edited": edited?.toIso8601String(),
        "url": url,
    };
}
