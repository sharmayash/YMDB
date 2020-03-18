import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './TvHomeGrid.dart';
import '../SearchScreen.dart';

import '../../widgets/MyDrawer.dart';
import '../../providers/tv/Tvs.dart';

class TvHomePage extends StatefulWidget {
  static const routeName = '/tv-shows';
  @override
  _TvHomePageState createState() => _TvHomePageState();
}

class _TvHomePageState extends State<TvHomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<TVS>(context, listen: false).loadPopularShows();
    Provider.of<TVS>(context, listen: false).loadTopRatedShows();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
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
                showSearch(context: context, delegate: SearchScreen());
              })
        ],
      ),
      body: TvHomeGrid(),
    );
  }
}
