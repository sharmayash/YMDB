import 'package:flutter/foundation.dart';

class Person with ChangeNotifier {
  final int id;
  final String birthDay;
  final String knownFor;
  final String deathDay;
  final String name;
  final List alsoKnownFor;
  final int gender;
  final String biography;
  final double popularity;
  final String birthPlace;
  final String profile_path;
  final bool adult;
  final String imdbId;
  final String homePage;

  Person({
    @required this.id,
    @required this.adult,
    @required this.popularity,
    @required this.alsoKnownFor,
    @required this.biography,
    @required this.birthDay,
    @required this.birthPlace,
    this.deathDay,
    @required this.gender,
    this.homePage,
    @required this.imdbId,
    @required this.knownFor,
    @required this.name,
    @required this.profile_path,
  });
}
