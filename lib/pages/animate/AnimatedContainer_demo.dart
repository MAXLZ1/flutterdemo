import 'package:flutter/material.dart';

class AnimatedContainerRoute extends StatefulWidget{
  @override
  _AnimatedContainerRouteState createState() {
    // TODO: implement createState
    return _AnimatedContainerRouteState();
  }
}

class _AnimatedContainerRouteState extends State<AnimatedContainerRoute>{
  Size size = Size(0,0);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedContainerDemo'),
      ),
      body: Center(
        child:Column(
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(seconds: 2),
              curve: Curves.easeInOutQuart,
              height: size.height,
              width: size.width,
              color: Colors.blue,
              margin: EdgeInsets.all(30),
              alignment: Alignment.center,
              child: Text('AnimatedContainer', style: TextStyle(color: Colors.white),),
            ),
            RaisedButton(
              child: Text('start animate'),
              onPressed: (){
                setState(() {
                  size = size.width == 0 ?  Size(300, 200) : Size(0,0);
                });
              },
            )
          ],
        ),
      )
    );
  }
}
