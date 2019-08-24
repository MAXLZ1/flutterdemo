import 'package:flutter/material.dart';
import '../fonts/iconfont.dart';
class IconDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              Icons.home,
              size: 30.0,
              color: Colors.green,
              semanticLabel: 'label',
              textDirection: TextDirection.rtl,
            ),
            Icon(
              IconData(0xe611, fontFamily: 'iconfont')
            ),
            Icon(
              Iconfont.daiding,
              color: Colors.blue,
            )
          ],
        )
      ],
    );
  }
}