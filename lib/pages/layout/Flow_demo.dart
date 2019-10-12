import 'package:flutter/material.dart';

class FlowDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Flow(
      delegate: TestFlowDelegate(margin:EdgeInsets.only(top: 10.0, left: 10.0)),
      children: <Widget>[
        Container(width: 80.0, height:80.0, color: Colors.red,),
        Container(width: 80.0, height:80.0, color: Colors.green,),
        Container(width: 80.0, height:80.0, color: Colors.blue,),
        Container(width: 80.0, height:80.0,  color: Colors.yellow,),
        Container(width: 80.0, height:80.0, color: Colors.brown,),
        Container(width: 80.0, height:80.0,  color: Colors.purple,),
      ],
    )
    ;
  }
}

class TestFlowDelegate extends FlowDelegate{
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    double x = margin.left;
    double y = margin.top;
    for (int i = 0; i < context.childCount; i++) {
      double w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        context.paintChild(i, transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }

}