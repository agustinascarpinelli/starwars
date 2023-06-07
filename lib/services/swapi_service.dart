

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:star_wars/models/planets_model.dart';
import 'package:star_wars/models/species_model.dart';

class SwapiService {
final _url ='swapi.dev';
Future <List <Species>> getSpecies ()async{
    final Uri url = Uri.https(_url, '/api/species/');
    final response = await http.get(url);
    final species= SwapiResponse.fromJson(response.body);
    return species.species!;
}

Future <PlanetResponse> getPlanet (String url)async{
    final Uri uri= Uri.parse(url);
    final response = await http.get(uri);
    final planet=PlanetResponse.fromJson(response.body);
    return planet;
}



  Future<dynamic> createReport( Species species) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'title':'Report', 'body': species.toString()}),
    );
    if (response.statusCode == 201) {
      if (response.body.isNotEmpty) {
        final res = json.decode(response.body);
        return res;
      } else {
        throw Exception('Empty response body');
      }
    } else {
      throw Exception('Failed to create post');
    }
  }

}