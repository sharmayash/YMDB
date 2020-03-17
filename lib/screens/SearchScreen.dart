import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ymdb/widgets/OurLoader.dart';

import '../providers/search/MultiSearch.dart';

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
                Center(child: CircularProgressIndicator()),
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
                    if (result['media_type'] == "movie") {
                      return ListTile(
                        title: Text("${result['title']} (Movie)"),
                      );
                    } else if (result['media_type'] == "tv") {
                      return ListTile(
                        title: Text("${result['name']} (TV)"),
                      );
                    } else if (result['media_type'] == "person") {
                      return ListTile(
                        title: Text("${result['name']} (Person)"),
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
