import 'package:flutter/material.dart';
import './Page.dart';

class RouteDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: RaisedButton(
        child: Text('打开新的路由'),
        onPressed: () async {
          Navigator.pushNamed(context, '/page', arguments: {'id': 324});
//          String result = await Navigator.push(
//              context,
//              MaterialPageRoute(
//                  builder: (context) => PageRouteDemo(param: '来自上个页面的数据'),
//                  // fullscreenDialog: false,
//                  settings: RouteSettings(arguments: {"id": 2123})));
//          if (result != null) {
//            Scaffold.of(context).showSnackBar(SnackBar(
//              content: Text(result),
//            ));
//          }
        },
      ),
    );
  }
}
