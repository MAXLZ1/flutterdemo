import 'package:flutter/material.dart';

class ListenerDemo extends StatefulWidget {
  @override
  _ListenerDemoState createState() => _ListenerDemoState();
}

class _ListenerDemoState extends State<ListenerDemo> {
  Offset offset = Offset(0.0, 0.0);
  String status = 'noPoint';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Listener(
            behavior: HitTestBehavior.opaque,
            child: Container(
              width: 300.0,
              height: 200.0,
              margin: EdgeInsets.only(bottom: 30.0),
              child: Center(
                child: Text('在此区域滑动',
                    style: TextStyle(color: Color(0xff000000), fontSize: 26)),
              ),
              alignment: Alignment.center,
            ),
            onPointerDown: (event) {
              setState(() {
                status = 'pointDown';
                offset = event.position;
              });
            },
            onPointerMove: (event) {
              setState(() {
                status = 'pointMove';
                offset = event.position;
              });
            },
            onPointerUp: (event) {
              setState(() {
                status = 'pointUp';
                offset = event.position;
              });
            },
          ),
          Text(
            '$status:$offset',
            style: TextStyle(fontSize: 22.0),
          ),
          SizedBox(height: 30.0,),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Listener(
                child: Container(
                  constraints: BoxConstraints.tight(Size(300, 200)),
                  decoration: BoxDecoration(
                      color: Colors.blue
                  ),
                ),
                onPointerDown: (event) => print('blue'),
              ),
              Listener(
                child: Container(
                  constraints: BoxConstraints.tight(Size(150, 100)),
                  child: Center(
                    child: Text('点击区域', style: TextStyle(color: Colors.white),),
                  ),
                ),
                onPointerDown: (event) => print('red'),
                behavior: HitTestBehavior.translucent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
///
/// 忽略PointerEvent
///
class AbsorbPointerDemo extends StatefulWidget{
  @override
  _AbsorbPointerDemoState createState() {
    // TODO: implement createState
    return _AbsorbPointerDemoState();
  }
}

class _AbsorbPointerDemoState extends State<AbsorbPointerDemo>{
  bool _absorb = false;
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '开启absorbing/ignoring属性'
            ),
            Switch(
              value: _absorb,
              onChanged: (val) {
                setState(() {
                  _absorb = val;
                });
              },
            )
          ],
        ),
        AbsorbPointer(
          absorbing: _absorb,
          child: RaisedButton(
            child: Text(
                'AbsorbPointer-button'
            ),
            onPressed: () => setState(() => _count++),
          ),
        ),
        IgnorePointer(
          ignoring: _absorb,
          child: RaisedButton(
            child: Text(
              'IgnorePointer-button'
            ),
            onPressed: () => setState(() => _count++),
          ),
        ),
        SizedBox(height: 30,),
        Text('count: $_count',style: TextStyle(fontSize: 20.0),)
      ],
    );
  }
}
