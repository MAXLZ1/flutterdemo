import 'package:flutter/material.dart';

class SingleChildScrollViewDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        mainAxisSize: MainAxisSize.max,
        textDirection: TextDirection.ltr,
        verticalDirection: VerticalDirection.down,
        textBaseline: TextBaseline.alphabetic,
        children: getContainers(20),
      ),
    );
  }
  
  List<Widget> getContainers (int length) {
    List<Widget> list = List();
    for (int i = 0; i < length; i++) {
      list.add(Container(
        width: double.infinity,
        height: 50.0,
        margin: EdgeInsets.only(top: 10.0),
        color: Colors.lightBlueAccent,
      ));
    }
    return list;
  }
}