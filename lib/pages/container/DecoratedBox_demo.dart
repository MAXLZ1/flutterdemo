import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DecoratedBoxDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(10.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffadf30e), Color(0xff3896fe)],
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black45,
                  offset: Offset(3.0, 3.0),
                  blurRadius: 6.0
              )
            ]
        ),
        child: Container(
          height: 100.0,
        ),
      ),
    );
  }
}