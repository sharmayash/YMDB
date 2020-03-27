import 'package:flutter/material.dart';

class DescriptionItem extends StatefulWidget {
  final String desc;

  DescriptionItem(this.desc);

  @override
  _DescriptionItemState createState() => _DescriptionItemState();
}

class _DescriptionItemState extends State<DescriptionItem> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 50),
      height: _expanded ? 300 : 80,
      child: Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('Desciption'),
              trailing: IconButton(
                icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 50),
              height: _expanded ? 200 : 0,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Text(
                  '${widget.desc}',
                  textScaleFactor: 1.2,
                  textAlign: TextAlign.left,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
