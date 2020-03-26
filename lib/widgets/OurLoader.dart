import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class OurLoader extends StatelessWidget {
  final String message;

  OurLoader(this.message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightGreen[100],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SpinKitPouringHourglass(
              color: Colors.black,
              size: 50.0,
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  this.message,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )),
          ],
        ));
  }
}
