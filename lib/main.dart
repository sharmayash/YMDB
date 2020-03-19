import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import './providers/tv/Tvs.dart';
import './providers/movies/Movies.dart';
import './providers/person/Persons.dart';
import './providers/search/MultiSearch.dart';

import './screens/PersonScreen.dart';
import './screens/tv/TvHomePage.dart';
import './screens/tv/TvItemScreen.dart';
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
          ChangeNotifierProvider(create: (_) => TVS()),
          ChangeNotifierProvider(create: (_) => Movies()),
          ChangeNotifierProvider(create: (_) => Persons()),
          ChangeNotifierProvider(create: (_) => MultiSearch()),
        ],
        child: MaterialApp(
          title: 'YMDB',
          theme: new ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          initialRoute: '/movies',
          routes: {
            HomePage.routeName: (ctx) => HomePage(),
            TvHomePage.routeName: (ctx) => TvHomePage(),
            TvItemScreen.routeName: (ctx) => TvItemScreen(),
            PersonScreen.routeName: (ctx) => PersonScreen(),
            MovieItemScreen.routeName: (ctx) => MovieItemScreen(),
          },
        ));
  }
}
