import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/OurLoader.dart';
import '../../providers/movies/Movies.dart';

class MovieItemScreen extends StatelessWidget {
  static const routeName = '/movie-detail';

  @override
  Widget build(BuildContext context) {
    final movieId = ModalRoute.of(context).settings.arguments as int;
    final movieFound = Provider.of<Movies>(
      context,
      listen: false,
    ).findById(movieId);

    return FutureBuilder(
        future: movieFound,
        builder: (context, AsyncSnapshot<Map> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return OurLoader("Loading");
            default:
              if (snapshot.hasError)
                return OurLoader("Something Went Wrong !!!");
              else
                return Scaffold(
                  appBar: AppBar(
                      title: Text(
                    '${snapshot.data['title']}',
                    softWrap: true,
                  )),
                  body: SingleChildScrollView(
                    child: Column(children: [
                      Container(
                        height: 300,
                        width: double.infinity,
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500/${snapshot.data['image']}',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          padding: EdgeInsets.all(30),
                          width: double.infinity,
                          color: Colors.black12,
                          child: Text(
                            '${snapshot.data['overview']}',
                            style: TextStyle(),
                            textScaleFactor: 1.5,
                            textAlign: TextAlign.left,
                            softWrap: true,
                          ),
                        ),
                      )
                    ]),
                  ),
                );
          }
        });
  }
}
