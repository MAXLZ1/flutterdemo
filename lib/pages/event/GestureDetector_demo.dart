import 'package:flutter/material.dart';

class GestureDetectorDemo extends StatefulWidget{
  @override
  _GestureDetectorDemoState createState() {
    // TODO: implement createState
    return _GestureDetectorDemoState();
  }
}

class _GestureDetectorDemoState extends State<GestureDetectorDemo>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 30.0),
              constraints: BoxConstraints.tight(Size(300.0, 200.0)),
              color: Theme.of(context).primaryColor,
              alignment: Alignment.center,
              child: Text('手势区域',style: TextStyle(color: Colors.white, fontSize: 30.0),),
            ),
            onTap: () => print('onTap'),
            onTapDown: (e) {
              print('onTapDown');
            },
            onTapUp: (e) {
              print('onTapUp');
            },
            onTapCancel: () {
              print('onTapCancel');
            },
            onSecondaryTapDown: (e) {
              print('onSecondaryTapDown');
            },
            onDoubleTap: () => setState(() {
              print('onDoubleTap');
            }),
            onLongPress: () => setState(() {
              print('onLongPress');
            }),
            onLongPressStart: (e) {
              print('onLongPressStart');
            },
            onLongPressMoveUpdate: (e) {
              print('onLongPressMoveUpdate');
            },
            onLongPressEnd: (e) {
              print('onLongPressEnd');
            },
            onLongPressUp: () {
              print('onLongPressUp');
            },
            onVerticalDragStart: (e) {
              print('onVerticalDragStart');
            },
            onVerticalDragDown: (e) {
              print('onVerticalDragDown');
            },
            onVerticalDragUpdate: (e) {
              print('onVerticalDragUpdate');
            },
            onVerticalDragEnd: (e) {
              print('onVerticalDragEnd');
            },
            onVerticalDragCancel: () {
              print('onVerticalDragCancel');
            },
//            onPanDown: (e) {
//              print('onPanDown');
//            },
//            onPanStart: (e) {
//              print('onPanStart');
//            },
//            onPanUpdate: (e) {
//              print('onPanUpdate');
//            },
//            onPanEnd: (e) {
//              print('onPanEnd');
//            },
            onScaleStart: (e) {
              print('onScaleStart');
            },
            onScaleUpdate: (e) {
              print('onScaleUpdate');
            },
            onScaleEnd: (e) {
              print('onScaleEnd');
            },
          ),
        ],
      ),
    );
  }
}

///
/// 拖动示例
///
class DragWidget extends StatefulWidget{
  @override
  _DragWidgetState createState() {
    // TODO: implement createState
    return _DragWidgetState();
  }
}

class _DragWidgetState extends State<DragWidget> {
  GlobalKey stackKey = GlobalKey();
  GlobalKey btnKey = GlobalKey();
  double _left = 0.0;
  double _top = 0.0;
  double _areaWidth = 0.0;
  double _areaHeight = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      setState(() {
        _areaWidth = stackKey.currentContext.size.width - btnKey.currentContext.size.width;
        _areaHeight = stackKey.currentContext.size.height - btnKey.currentContext.size.height;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      key: stackKey,
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: FloatingActionButton(
              key: btnKey,
              child: Text('drag'),
            ),
            onPanUpdate: (e) {
              setState(() {
                _left += e.delta.dx;
                _top += e.delta.dy;
                if (_left < 0) {
                  _left = 0;
                } else if (_left > _areaWidth) {
                  _left = _areaWidth;
                }
                if (_top < 0) {
                  _top = 0;
                } else if (_top > _areaHeight) {
                  _top = _areaHeight;
                }
              });
            },
          )
        )
      ],
    );
  }
}
class ScaleWidget extends StatefulWidget{
  @override
  _ScaleWidgetState createState() {
    // TODO: implement createState
    return _ScaleWidgetState();
  }
}
class _ScaleWidgetState extends State<ScaleWidget>{
  double _width = 300.0;
  double _height = 200.0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: GestureDetector(
        child: Container(
          constraints: BoxConstraints.tight(Size(_width, _height)),
          color: Colors.blue,
        ),
        onScaleUpdate: (e) {
          print(e);
          setState(() {
            // 限制宽度缩放比例在0.7-1.2之间，如果超过这个范围，Container会变为原来的大小
            _width = 300* e.scale.clamp(0.7, 1.2);
            _height = 200*e.scale.clamp(0.7, 1.2);
          });
        },
      )
    );
  }
}
