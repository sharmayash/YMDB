import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './HomeGrid.dart';
import './SearchScreen.dart';

import '../providers/movies/Movies.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<Movies>(context, listen: false).loadPopularMovies();
    Provider.of<Movies>(context, listen: false).loadTopRatedMovies();
    Provider.of<Movies>(context, listen: false).loadNowPlayingMovies();
    Provider.of<Movies>(context, listen: false).loadUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "YMDB",
          style: TextStyle(letterSpacing: 2),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.of(context).pushNamed(SearchScreen.routeName);
              })
        ],
      ),
      body: HomeGrid(),
    );
  }
}
