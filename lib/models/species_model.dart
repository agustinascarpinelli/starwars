// To parse this JSON data, do
//
//     final swapiResponse = swapiResponseFromMap(jsonString);

import 'dart:convert';

class SwapiResponse {
    int? count;
    String? next;
    dynamic previous;
    List<Species>? species;

    SwapiResponse({
        this.count,
        this.next,
        this.previous,
        this.species,
    });

    SwapiResponse copyWith({
        int? count,
        String? next,
        dynamic previous,
        List<Species>? results,
    }) => 
        SwapiResponse(
            count: count ?? this.count,
            next: next ?? this.next,
            previous: previous ?? this.previous,
            species: results ?? this.species,
        );

    factory SwapiResponse.fromJson(String str) => SwapiResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory SwapiResponse.fromMap(Map<String, dynamic> json) => SwapiResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        species: json["results"] == null ? [] : List<Species>.from(json["results"]!.map((x) => Species.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": species == null ? [] : List<dynamic>.from(species!.map((x) => x.toMap())),
    };
}

class Species {
    String? name;
    String? classification;
    Designation? designation;
    String? averageHeight;
    String? skinColors;
    String? hairColors;
    String? eyeColors;
    String? averageLifespan;
    String? homeworld;
    String? language;
    List<String>? people;
    List<String>? films;
    DateTime? created;
    DateTime? edited;
    String? url;

    Species({
        this.name,
        this.classification,
        this.designation,
        this.averageHeight,
        this.skinColors,
        this.hairColors,
        this.eyeColors,
        this.averageLifespan,
        this.homeworld,
        this.language,
        this.people,
        this.films,
        this.created,
        this.edited,
        this.url,
    });

    Species copyWith({
        String? name,
        String? classification,
        Designation? designation,
        String? averageHeight,
        String? skinColors,
        String? hairColors,
        String? eyeColors,
        String? averageLifespan,
        String? homeworld,
        String? language,
        List<String>? people,
        List<String>? films,
        DateTime? created,
        DateTime? edited,
        String? url,
    }) => 
        Species(
            name: name ?? this.name,
            classification: classification ?? this.classification,
            designation: designation ?? this.designation,
            averageHeight: averageHeight ?? this.averageHeight,
            skinColors: skinColors ?? this.skinColors,
            hairColors: hairColors ?? this.hairColors,
            eyeColors: eyeColors ?? this.eyeColors,
            averageLifespan: averageLifespan ?? this.averageLifespan,
            homeworld: homeworld ?? this.homeworld,
            language: language ?? this.language,
            people: people ?? this.people,
            films: films ?? this.films,
            created: created ?? this.created,
            edited: edited ?? this.edited,
            url: url ?? this.url,
        );

    factory Species.fromJson(String str) => Species.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Species.fromMap(Map<String, dynamic> json) => Species(
        name: json["name"],
        classification: json["classification"],
        designation: designationValues.map[json["designation"]]!,
        averageHeight: json["average_height"],
        skinColors: json["skin_colors"],
        hairColors: json["hair_colors"],
        eyeColors: json["eye_colors"],
        averageLifespan: json["average_lifespan"],
        homeworld: json["homeworld"],
        language: json["language"],
        people: json["people"] == null ? [] : List<String>.from(json["people"]!.map((x) => x)),
        films: json["films"] == null ? [] : List<String>.from(json["films"]!.map((x) => x)),
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
        edited: json["edited"] == null ? null : DateTime.parse(json["edited"]),
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "classification": classification,
        "designation": designationValues.reverse[designation],
        "average_height": averageHeight,
        "skin_colors": skinColors,
        "hair_colors": hairColors,
        "eye_colors": eyeColors,
        "average_lifespan": averageLifespan,
        "homeworld": homeworld,
        "language": language,
        "people": people == null ? [] : List<dynamic>.from(people!.map((x) => x)),
        "films": films == null ? [] : List<dynamic>.from(films!.map((x) => x)),
        "created": created?.toIso8601String(),
        "edited": edited?.toIso8601String(),
        "url": url,
    };

    
}

enum Designation { SENTIENT, REPTILIAN }

final designationValues = EnumValues({
    "reptilian": Designation.REPTILIAN,
    "sentient": Designation.SENTIENT
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}