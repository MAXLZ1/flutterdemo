import 'package:flutter/material.dart';

class WrapDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Widget c1 = Container(
      height: 130.0,
      width: 130.0,
      color: Colors.redAccent,
    );
    Widget c2 = Container(
      height: 50.0,
      width: 50.0,
      color: Colors.lightBlueAccent,
    );
    Widget c3 = Container(
      height: 80.0,
      width: 80.0,
      color: Colors.yellow,
    );
    Widget c4 =  Container(
      height: 100.0,
      width: 100.0,
      color: Colors.greenAccent,
    );
    Widget c5 = Container(
      height: 170.0,
      width: 170.0,
      color: Colors.grey,
    );
    // TODO: implement build
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 10.0,
        runSpacing: 20.0,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.spaceEvenly,
        crossAxisAlignment: WrapCrossAlignment.center,
        verticalDirection: VerticalDirection.down,
        textDirection: TextDirection.ltr,
        children: <Widget>[c1, c2, c3, c4, c5],
      ),
    );
  }
}