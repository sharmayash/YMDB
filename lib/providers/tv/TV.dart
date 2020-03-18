import 'package:flutter/foundation.dart';

class TV with ChangeNotifier {
  final int id;
  final bool adult;
  final String name;
  final int voteCount;
  final List genreIds;
  final String overview;
  final double popularity;
  final String posterPath;
  final List originCountry;
  final double voteAverage;
  final String firstAirDate;
  final String originalName;
  final String backdropPath;
  final String originalLanguage;

  TV(
      {@required this.id,
      @required this.adult,
      @required this.name,
      @required this.voteCount,
      @required this.genreIds,
      @required this.originCountry,
      @required this.overview,
      @required this.popularity,
      @required this.posterPath,
      @required this.voteAverage,
      @required this.firstAirDate,
      @required this.originalLanguage,
      @required this.backdropPath,
      @required this.originalName});
}
