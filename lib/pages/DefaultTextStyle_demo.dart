import 'package:flutter/material.dart';

class DefaultTextStyleDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.green
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  'Hello World!'
              ),
              SizedBox(height: 20.0,),
              Text(
                'Hello World!',
                style: TextStyle(
                    inherit: false,
                  color: Colors.black
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}