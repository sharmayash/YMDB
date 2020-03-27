import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../widgets/OurLoader.dart';
import '../screens/PersonScreen.dart';
import '../screens/tv/TvItemScreen.dart';
import '../providers/search/MultiSearch.dart';
import '../screens/movies/MovieItemScreen.dart';

class SearchScreen extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme;
  }

  List<Widget> buildActions(BuildContext context) {
    // implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // implement buildResults

    return FutureBuilder(
        future: Provider.of<MultiSearch>(context, listen: false).queries(query),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                    child: SpinKitFadingCube(
                  color: Colors.lightGreen,
                  size: 45.0,
                )),
              ],
            );
          } else if (snapshot.data.length == 0) {
            return Column(
              children: <Widget>[
                Text(
                  "No Results Found.",
                ),
              ],
            );
          } else {
            var results = snapshot.data;
            if (results == null) {
              return OurLoader("Loading");
            } else {
              return ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    var result = results[index];
                    switch (result['media_type']) {
                      case "movie":
                        return ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          title: Text(
                            "${result['title']} (Movie)",
                            softWrap: true,
                          ),
                          leading: Image.network(
                            'https://image.tmdb.org/t/p/w500${result['poster_path']}',
                            fit: BoxFit.cover,
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                MovieItemScreen.routeName,
                                arguments: result['id']);
                          },
                        );
                      case "tv":
                        return ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          title: Text(
                            "${result['name']} (TV)",
                            softWrap: true,
                          ),
                          leading: Image.network(
                            'https://image.tmdb.org/t/p/w500${result['poster_path']}',
                            fit: BoxFit.cover,
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                TvItemScreen.routeName,
                                arguments: result['id']);
                          },
                        );
                      default:
                        return ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          title: Text(
                            "${result['name']} (Person)",
                            softWrap: true,
                          ),
                          leading: Image.network(
                            'https://image.tmdb.org/t/p/w500${result['profile_path']}',
                            fit: BoxFit.cover,
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                PersonScreen.routeName,
                                arguments: result['id']);
                          },
                        );
                    }
                  });
            }
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // implement buildSuggestions
    return Column();
  }
}
