import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MultiSearch with ChangeNotifier {
  var _apiKey = DotEnv().env['API_KEY'];

  Future<List> queries(String newQuery) async {
    var url =
        "https://api.themoviedb.org/3/search/multi?api_key=$_apiKey&language=en-US&query=$newQuery&page=1";

    var response = await http.get(url);
    List _newSearchList;

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      _newSearchList = jsonResponse['results'];

      notifyListeners();
    }
    return [..._newSearchList];
  }
}
