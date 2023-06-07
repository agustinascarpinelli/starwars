import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:star_wars/models/planets_model.dart';
import 'package:star_wars/models/species_model.dart';

class SwapiService {
  final _url = 'swapi.dev';

  Future<Either<String, List<Species>>> getSpecies() async {
    try {
      final Uri url = Uri.https(_url, '/api/species/');
      final response = await http.get(url);
      final species = SwapiResponse.fromJson(response.body);
      return Right(species.species!);
    } catch (e) {
      return const Left('Failed to fetch species');
    }
  }

  Future<Either<String, PlanetResponse>> getPlanet(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      final response = await http.get(uri);
      final planet = PlanetResponse.fromJson(response.body);
      return Right(planet);
    } catch (e) {
      return const Left('Failed to fetch planet');
    }
  }

  Future<Option<Map<String, dynamic>>> createReport(Species species) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': 'Report',
        'body': species.toString(),
      }),
    );
    if (response.statusCode == 201) {
      if (response.body.isNotEmpty) {
        final res = json.decode(response.body);
        return Some(res);
      } else {
        return const None();
      }
    } else {
      return const None();
    }
  }
}
