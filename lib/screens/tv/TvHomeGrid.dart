import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/TvItem.dart';
import '../../providers/tv/Tvs.dart';

class TvHomeGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final popularShows = Provider.of<TVS>(context, listen: false).popularShows;
    final topRatedShows =
        Provider.of<TVS>(context, listen: false).topRatedShows;
    // print(topRatedShows);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "TV Shows",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(40, 10, 40, 0),
            padding: EdgeInsets.fromLTRB(20, 6, 20, 6),
            color: Colors.black45,
            child: Text(
              "Popular",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Container(
            height: 200.0,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(10.0),
              itemCount: popularShows.length,
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: popularShows[i],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TvItem(),
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
            color: Colors.black45,
            child: Text(
              "Top Rated",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Container(
            height: 200.0,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(10.0),
              itemCount: topRatedShows.length,
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: topRatedShows[i],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TvItem(),
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
