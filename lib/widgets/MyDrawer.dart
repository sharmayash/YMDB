import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  Widget buildListTile(String title, Function tapHandler) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 20, letterSpacing: 2),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            color: Theme.of(context).primaryColor,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Text(
              "YMDB",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 20,
                letterSpacing: 2.5,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile("Movies", () {
            Navigator.of(context).pushReplacementNamed('/movies');
          }),
          buildListTile("Tv Shows", () {
            Navigator.of(context).pushReplacementNamed('/tv-shows');
          }),
        ],
      ),
    );
  }
}
