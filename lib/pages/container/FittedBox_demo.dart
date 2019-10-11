import 'package:flutter/material.dart';

class FittedBoxDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 120.0,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: const Color(0xffff0000)
        )
      ),
      margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 40.0),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Image(
          image: NetworkImage('http://pic39.nipic.com/20140307/13928177_195158772185_2.jpg'),
        ),
      ),
    );
  }
}