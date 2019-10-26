import 'package:flutter/material.dart';
import 'dart:ui';

class GetWidgetSize extends StatelessWidget {
  GlobalKey _key1 = GlobalKey();
  GlobalKey _key2 = GlobalKey();
  GlobalKey _key3 = GlobalKey();

  @override
  Widget build(BuildContext context) {
//    Size size = MediaQuery.of(context).size;
//    double device = MediaQuery.of(context).devicePixelRatio;
//    double top = MediaQuery.of(context).padding.top;
//    double bottom = MediaQuery.of(context).padding.bottom;
//    print(device);
//    Size size2 = window.physicalSize;
//    print(size2);
//    print(window.devicePixelRatio);
    WidgetsBinding.instance.addPostFrameCallback((duration){
      RenderBox box = _key1.currentContext.findRenderObject();
      // _key1.currentContext.size;
      print(box.size);
      print(box.localToGlobal(Offset.zero));
    });

    // TODO: implement build
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            key: _key1,
            constraints: BoxConstraints.tight(Size(200, 100)),
            color: Colors.red,
          ),
          Container(
            key: _key2,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            constraints: BoxConstraints.tight(Size(200, 100)),
            color: Colors.yellow,
          ),
          Container(
            key: _key3,
            constraints: BoxConstraints.tight(Size(200, 100)),
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
