import 'package:flutter/material.dart';

class WillPopScopeDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WillPopScopeDemoState();
  }
}

class _WillPopScopeDemoState extends State<WillPopScopeDemo> {
  DateTime _lastPressedAt; //上次点击时间

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      child: Center(
        child: Text('1秒内连续按两次返回键退出'),
      ),
      onWillPop: () async {
        if (_lastPressedAt == null || DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
          _lastPressedAt = DateTime.now();
          return false;
        }
        return true;
      },
    );
  }
}