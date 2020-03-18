import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/tv/TV.dart';
import '../screens/tv/TvItemScreen.dart';

class TvItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TV>(
      builder: (context, tvShow, child) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridTile(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(TvItemScreen.routeName, arguments: tvShow.id);
              },
              child: Image.network(
                tvShow.posterPath,
                fit: BoxFit.cover,
              ),
            ),
            footer: GridTileBar(
              backgroundColor: Colors.black38,
              title: Text(
                tvShow.name,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }
}
