import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import './providers/movies/Movies.dart';

import './screens/HomePage.dart';
import './screens/SearchScreen.dart';
import './screens/MovieItemScreen.dart';

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
        ],
        child: MaterialApp(
          title: 'YMDB',
          theme: new ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          home: HomePage(),
          routes: {
            MovieItemScreen.routeName: (ctx) => MovieItemScreen(),
            SearchScreen.routeName: (ctx) => SearchScreen()
          },
        ));
  }
}
