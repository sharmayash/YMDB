import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import './Movie.dart';

class Movies with ChangeNotifier {
  var _apiKey = DotEnv().env['API_KEY'];

  List<Movie> _popularMoviesList = [];
  List<Movie> _topRatedMoviesList = [];
  List<Movie> _nowPlayingMoviesList = [];
  List<Movie> _upcomingMoviesList = [];

  int popularPage = 1;
  int topRatedPage = 1;
  int nowPlayingPage = 1;
  int upcomingPage = 1;

  void loadPopularMovies() async {
    var url =
        "https://api.themoviedb.org/3/movie/popular?api_key=$_apiKey&language=en-US&popularPage=$popularPage";

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      jsonResponse['results'].forEach((item) => {
            _popularMoviesList.add(Movie(
                posterPath:
                    "https://image.tmdb.org/t/p/w500${item['poster_path']}",
                adult: item['adult'],
                overview: item['overview'],
                releaseDate: item['release_date'],
                genreIds: item['genre_ids'],
                id: item['id'],
                originalTitle: item['original_title'],
                originalLanguage: item['original_language'],
                title: item['title'],
                backdropPath:
                    "https://image.tmdb.org/t/p/w500${item['backdrop_path']}",
                popularity: item['popularity'].toDouble(),
                voteCount: item['vote_count'],
                video: item['video'],
                voteAverage: item['vote_average'].toDouble()))
          });

      popularPage++;
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  void loadTopRatedMovies() async {
    var url =
        "https://api.themoviedb.org/3/movie/top_rated?api_key=$_apiKey&language=en-US&page=$topRatedPage";

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      jsonResponse['results'].forEach((item) => {
            _topRatedMoviesList.add(Movie(
                posterPath:
                    "https://image.tmdb.org/t/p/w500${item['poster_path']}",
                adult: item['adult'],
                overview: item['overview'],
                releaseDate: item['release_date'],
                genreIds: item['genre_ids'],
                id: item['id'],
                originalTitle: item['original_title'],
                originalLanguage: item['original_language'],
                title: item['title'],
                backdropPath:
                    "https://image.tmdb.org/t/p/w500${item['backdrop_path']}",
                popularity: item['popularity'].toDouble(),
                voteCount: item['vote_count'],
                video: item['video'],
                voteAverage: item['vote_average'].toDouble()))
          });

      topRatedPage++;
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  void loadNowPlayingMovies() async {
    var url =
        "https://api.themoviedb.org/3/movie/now_playing?api_key=$_apiKey&language=en-US&page=$nowPlayingPage&region=IN";

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      jsonResponse['results'].forEach((item) => {
            _nowPlayingMoviesList.add(Movie(
                posterPath:
                    "https://image.tmdb.org/t/p/w500${item['poster_path']}",
                adult: item['adult'],
                overview: item['overview'],
                releaseDate: item['release_date'],
                genreIds: item['genre_ids'],
                id: item['id'],
                originalTitle: item['original_title'],
                originalLanguage: item['original_language'],
                title: item['title'],
                backdropPath:
                    "https://image.tmdb.org/t/p/w500${item['backdrop_path']}",
                popularity: item['popularity'].toDouble(),
                voteCount: item['vote_count'],
                video: item['video'],
                voteAverage: item['vote_average'].toDouble()))
          });

      nowPlayingPage++;
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  void loadUpcomingMovies() async {
    var url =
        "https://api.themoviedb.org/3/movie/upcoming?api_key=$_apiKey&language=en-US&page=$upcomingPage";

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      jsonResponse['results'].forEach((item) => {
            _upcomingMoviesList.add(Movie(
                posterPath:
                    "https://image.tmdb.org/t/p/w500${item['poster_path']}",
                adult: item['adult'],
                overview: item['overview'],
                releaseDate: item['release_date'],
                genreIds: item['genre_ids'],
                id: item['id'],
                originalTitle: item['original_title'],
                originalLanguage: item['original_language'],
                title: item['title'],
                backdropPath:
                    "https://image.tmdb.org/t/p/w500${item['backdrop_path']}",
                popularity: item['popularity'],
                voteCount: item['vote_count'],
                video: item['video'],
                voteAverage: item['vote_average'].toDouble()))
          });

      upcomingPage++;
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  List<Movie> get popularMovies {
    return [..._popularMoviesList];
  }

  List<Movie> get topRatedMovies {
    return [..._topRatedMoviesList];
  }

  List<Movie> get nowPlayingMovies {
    return [..._nowPlayingMoviesList];
  }

  List<Movie> get upcomingMovies {
    return [..._upcomingMoviesList];
  }

  Future<Map> findById(int id) async {
    var url =
        "https://api.themoviedb.org/3/movie/$id?api_key=$_apiKey&language=en-US";

    var response = await http.get(url);
    Map movieFound;

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      movieFound = {
        'id': id,
        'title': jsonResponse['title'],
        'overview': jsonResponse['overview'],
        'image': jsonResponse['backdrop_path'],
        'rating': jsonResponse['vote_average'],
        'date': jsonResponse['release_date'],
      };

      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return movieFound;
  }
}
