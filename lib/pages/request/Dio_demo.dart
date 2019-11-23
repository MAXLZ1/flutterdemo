import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DioTestRoute extends StatefulWidget{
  @override
  _DioTestRouteState createState() {
    // TODO: implement createState
    return _DioTestRouteState();
  }
}

class _DioTestRouteState extends State<DioTestRoute>{
  String text = '当前未请求数据';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('DioTest'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('start request'),
              onPressed: () async {
                setState(() {
                  text = '正在请求数据';
                });
                Dio dio = Dio();
                Response response = await dio.post('http://123.235.7.126:48099/app/login', queryParameters: {'password': '123456','username':'SL248'});
                print(response.data);
              },
            ),
            Text('$text')
          ],
        ),
      ),
    );
  }
}