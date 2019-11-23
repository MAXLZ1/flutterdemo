import 'package:flutter/material.dart';
import 'package:flutterdemo/util/NetUtil.dart';

class RequestTestRoute extends StatefulWidget{
  @override
  _RequestTestRouteState createState() {
    // TODO: implement createState
    return _RequestTestRouteState();
  }
}

class _RequestTestRouteState extends State<RequestTestRoute>{
  String _result;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('RequestTest'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('start request'),
              onPressed: () async {
                String result = await NetUtil.post('http://123.235.7.126:48099/app/login', {'password': '123456','username':'SL248'});
                setState(() {
                  _result = result;
                });
              },
            ),
            Text('$_result')
          ],
        ),
      ),
    );
  }
}