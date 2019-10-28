import 'package:flutter/material.dart';

class PageRouteDemo extends StatelessWidget {
  String param;
  PageRouteDemo({this.param});

  @override
  Widget build(BuildContext context) {
    Map map = ModalRoute.of(context).settings.arguments;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('pageRoute'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, '页面返回时传递的数据');
            }),
      ),
      body: Center(
        child: Text('通过构造函数传递: $param；settings参数传递：${map["id"]}'),
      ),
    );
  }
}
