import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/movies/Movie.dart';
import '../screens/MovieItemScreen.dart';

class MovieItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Movie>(
      builder: (context, movie, child) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridTile(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(MovieItemScreen.routeName, arguments: movie.id);
              },
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
              ),
            ),
            footer: GridTileBar(
              backgroundColor: Colors.black38,
              title: Text(
                movie.title,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }
}
