import 'package:flutter/material.dart';

class InkWellRoute extends StatefulWidget{
  @override
  _InkWellRouteState createState() {
    // TODO: implement createState
    return _InkWellRouteState();
  }
}

class _InkWellRouteState extends State<InkWellRoute>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('InkWell'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Ink(
              height: 300,
              width: 300,
              color: Colors.red,
              child: InkWell(
                splashColor: Colors.greenAccent,
                onTap: (){},
                child: Center(
                  child: Text('点击我出现水波纹', style: TextStyle(color: Colors.white, fontSize: 25.0),),
                )
              ),
            ),
            SizedBox(height: 30,),
            Ink.image(
              image: AssetImage('assets/images/lake.jpg'),
              height: 250,
              width: 400,
              fit: BoxFit.cover,
              child: InkWell(
                splashColor: Colors.greenAccent,
                onTap: (){},
                child: Center(
                  child: Text('点击我出现水波纹', style: TextStyle(color: Colors.white, fontSize: 25.0),),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}