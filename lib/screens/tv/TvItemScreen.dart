import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/tv/Tvs.dart';
import '../../widgets/OurLoader.dart';
import '../../widgets/DescriptionItem.dart';

class TvItemScreen extends StatelessWidget {
  static const routeName = '/tv-detail';

  @override
  Widget build(BuildContext context) {
    final showId = ModalRoute.of(context).settings.arguments as int;
    final showFound = Provider.of<TVS>(
      context,
      listen: false,
    ).findShowById(showId);

    return FutureBuilder(
        future: showFound,
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
                    '${snapshot.data['name']}',
                    softWrap: true,
                  )),
                  body: SingleChildScrollView(
                    child: Column(children: [
                      Container(
                        height: 250,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500${snapshot.data['image']}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(30)),
                            child: Container(
                              height: 80,
                              color: Colors.black54,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    "Total Season:- ${snapshot.data['seasons']}",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'DancingScript',
                                        letterSpacing: 1.4,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 1,
                                    child: Container(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "Rating:- ${snapshot.data['rating']}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'DancingScript',
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      DescriptionItem(snapshot.data['overview']),
                    ]),
                  ),
                );
          }
        });
  }
}
