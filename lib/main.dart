import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:ymdb/providers/search/MultiSearch.dart';
import 'package:ymdb/providers/tv/Tvs.dart';
import 'package:ymdb/screens/tv/TvHomePage.dart';

import './providers/movies/Movies.dart';

import './screens/movies/HomePage.dart';
import './screens/movies/MovieItemScreen.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: Movies()),
          ChangeNotifierProvider.value(value: TVS()),
          ChangeNotifierProvider.value(value: MultiSearch()),
        ],
        child: MaterialApp(
          title: 'YMDB',
          theme: new ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          // home: HomePage(),
          initialRoute: '/movies',
          routes: {
            HomePage.routeName: (ctx) => HomePage(),
            MovieItemScreen.routeName: (ctx) => MovieItemScreen(),
            TvHomePage.routeName: (ctx) => TvHomePage()
          },
        ));
  }
}
