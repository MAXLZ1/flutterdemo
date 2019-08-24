import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          width: 400,
          height: 300,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.grey
          ),
          child: Text(
            'Hello worldworldworldworldworldworldworldworld',
            style: TextStyle(
                color: null,
                backgroundColor: null,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                letterSpacing: 5.0,
                wordSpacing: 6.0,
                textBaseline: TextBaseline.ideographic,
                height: 1.5,
                background: Paint()..color = Colors.blue,
                foreground: Paint()..color = Colors.red,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
                decorationStyle: TextDecorationStyle.dashed,
                decorationThickness: 3,
                shadows: [
                  Shadow(
                      color: Colors.black,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 0.0)
                  ),
                ]
            ),
            textAlign: TextAlign.start,
            textDirection: TextDirection.ltr,
            softWrap: true,
            overflow: TextOverflow.visible,
            textScaleFactor: 1.5,
          ),
        ),
      ],
    );
  }
}
