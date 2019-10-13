import 'package:flutter/material.dart';

class CardDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 60.0,
      child: Card(
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        borderOnForeground: true,
        clipBehavior: Clip.none,
        semanticContainer: false,
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('标题一'),
                    SizedBox(height: 3.0),
                    Text('副标题', style: TextStyle(fontSize: 10),)
                  ],
                ),
              ),
              Container(
                child: Icon(Icons.keyboard_arrow_right, size: 19,),
              )
            ],
          ),
        ),
      )
    );
  }
}