import 'package:flutter/material.dart';

class PageOne extends StatelessWidget{
  String arguments;
  PageOne({this.arguments});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('PageOne'),
      ),
      body: Center(
        child: Text('数据:$arguments'),
      ),
    );
  }
}