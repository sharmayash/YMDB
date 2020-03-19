import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import './Person.dart';

class Persons with ChangeNotifier {
  var _apiKey = DotEnv().env['API_KEY'];

  Future<Person> findPersonById(int id) async {
    var url =
        "https://api.themoviedb.org/3/person/$id?api_key=$_apiKey&language=en-US";

    var response = await http.get(url);

    switch (response.statusCode) {
      case 200:
        var jsonResponse = convert.jsonDecode(response.body);

        notifyListeners();

        return Person(
            id: jsonResponse['id'],
            adult: jsonResponse['adult'],
            popularity: jsonResponse['popularity'].toDouble(),
            alsoKnownFor: jsonResponse['also_known_as'],
            biography: jsonResponse['biography'],
            birthDay: jsonResponse['birthday'],
            birthPlace: jsonResponse['place_of_birth'],
            gender: jsonResponse['gender'],
            imdbId: jsonResponse['imdb_id'],
            knownFor: jsonResponse['known_for_department'],
            name: jsonResponse['name'],
            profile_path:
                'https://image.tmdb.org/t/p/w500${jsonResponse['profile_path']}');
        break;
      default:
        return null;
    }
  }
}
