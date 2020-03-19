import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/OurLoader.dart';
import '../providers/person/Person.dart';
import '../providers/person/Persons.dart';

class PersonScreen extends StatelessWidget {
  static const routeName = '/person-detail';

  @override
  Widget build(BuildContext context) {
    final personId = ModalRoute.of(context).settings.arguments as int;
    final personFound = Provider.of<Persons>(
      context,
      listen: false,
    ).findPersonById(personId);

    return FutureBuilder(
        future: personFound,
        builder: (context, AsyncSnapshot<Person> snapshot) {
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
                    '${snapshot.data.name}',
                    softWrap: true,
                  )),
                  body: SingleChildScrollView(
                    child: Column(children: [
                      Container(
                        height: 300,
                        width: double.infinity,
                        child: Image.network(
                          '${snapshot.data.profile_path}',
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
                            '${snapshot.data.biography}',
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
