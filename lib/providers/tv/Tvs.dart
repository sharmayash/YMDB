import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import './TV.dart';

class TVS with ChangeNotifier {
  var _apiKey = DotEnv().env['API_KEY'];

  List<TV> _popularShows = [];
  List<TV> _topRatedShows = [];

  int _popularPage = 1;
  int _topRatedPage = 1;

  void loadPopularShows() async {
    var url =
        "https://api.themoviedb.org/3/tv/popular?api_key=$_apiKey&language=en-US&page=$_popularPage";

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      jsonResponse['results'].forEach((item) => {
            _popularShows.add(TV(
                posterPath:
                    "https://image.tmdb.org/t/p/w500${item['poster_path']}",
                adult: item['adult'],
                overview: item['overview'],
                firstAirDate: item['first_air_date'],
                genreIds: item['genre_ids'],
                id: item['id'],
                originalName: item['original_name'],
                originalLanguage: item['original_language'],
                name: item['name'],
                backdropPath:
                    "https://image.tmdb.org/t/p/w500${item['backdrop_path']}",
                popularity: item['popularity'].toDouble(),
                voteCount: item['vote_count'],
                originCountry: item['origin_country'],
                voteAverage: item['vote_average'].toDouble()))
          });

      // _popularPage++;
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  void loadTopRatedShows() async {
    var url =
        "https://api.themoviedb.org/3/tv/top_rated?api_key=$_apiKey&language=en-US&page=$_topRatedPage";

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      jsonResponse['results'].forEach((item) => {
            _topRatedShows.add(TV(
                posterPath:
                    "https://image.tmdb.org/t/p/w500${item['poster_path']}",
                adult: item['adult'],
                overview: item['overview'],
                firstAirDate: item['first_air_date'],
                genreIds: item['genre_ids'],
                id: item['id'],
                originalName: item['original_name'],
                originalLanguage: item['original_language'],
                name: item['name'],
                backdropPath:
                    "https://image.tmdb.org/t/p/w500${item['backdrop_path']}",
                popularity: item['popularity'].toDouble(),
                voteCount: item['vote_count'],
                originCountry: item['origin_country'],
                voteAverage: item['vote_average'].toDouble()))
          });

      // _topRatedPage++;
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  List<TV> get popularShows {
    return [..._popularShows];
  }

  List<TV> get topRatedShows {
    return [..._topRatedShows];
  }

  Future<Map> findShowById(int id) async {
    var url =
        "https://api.themoviedb.org/3/tv/$id?api_key=$_apiKey&language=en-US";

    var response = await http.get(url);
    Map showFound;

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      showFound = {
        'id': id,
        'name': jsonResponse['name'],
        'overview': jsonResponse['overview'],
        'image': jsonResponse['backdrop_path'],
        'rating': jsonResponse['vote_average'],
        'seasons': jsonResponse['number_of_seasons'],
      };

      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return showFound;
  }
}
