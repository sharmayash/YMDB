import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/MovieItem.dart';
import '../../providers/movies/Movies.dart';

class HomeGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final popularMovies = Provider.of<Movies>(context).popularMovies;
    final topRatedMovies = Provider.of<Movies>(context).topRatedMovies;
    final nowPlayingMovies = Provider.of<Movies>(context).nowPlayingMovies;
    final upcomingMovies = Provider.of<Movies>(context).upcomingMovies;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Movies",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(40, 10, 40, 0),
            padding: EdgeInsets.fromLTRB(20, 6, 20, 6),
            color: Theme.of(context).accentColor,
            child: Text("Popular",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5),
          ),
          Container(
            height: 200.0,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(10.0),
              itemCount: popularMovies.length,
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: popularMovies[i],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MovieItem(),
                ),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(40, 10, 40, 0),
            padding: EdgeInsets.fromLTRB(20, 6, 20, 6),
            color: Theme.of(context).accentColor,
            child: Text("Top Rated",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5),
          ),
          Container(
            height: 200.0,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(10.0),
              itemCount: topRatedMovies.length,
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: topRatedMovies[i],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MovieItem(),
                ),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(40, 10, 40, 0),
            padding: EdgeInsets.fromLTRB(20, 6, 20, 6),
            color: Theme.of(context).accentColor,
            child: Text("Upcoming",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5),
          ),
          Container(
            height: 200.0,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(10.0),
              itemCount: upcomingMovies.length,
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: upcomingMovies[i],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MovieItem(),
                ),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(40, 10, 40, 0),
            padding: EdgeInsets.fromLTRB(20, 6, 20, 6),
            color: Theme.of(context).accentColor,
            child: Text("Movies In Indian Cinemas",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5),
          ),
          Container(
            height: 200.0,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(10.0),
              itemCount: nowPlayingMovies.length,
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: nowPlayingMovies[i],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MovieItem(),
                ),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
