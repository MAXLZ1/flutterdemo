import 'package:flutter/material.dart';

class AnimatedSizeRoute extends StatefulWidget{
  @override
  _AnimatedSizeRouteState createState() {
    // TODO: implement createState
    return _AnimatedSizeRouteState();
  }
}

class _AnimatedSizeRouteState extends State<AnimatedSizeRoute> with SingleTickerProviderStateMixin{
  double _size = 100.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedSize'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            AnimatedSize(
              child: Container(
                height: _size,
                width: _size,
                color: Colors.red,
              ),
              curve: Curves.bounceOut,
              duration: Duration(seconds: 1),
              vsync: this,
            ),
            RaisedButton(
              child: Text('start animate'),
              onPressed: (){
                setState(() {
                  _size = (_size == 100.0 ? 300.0 : 100.0);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}