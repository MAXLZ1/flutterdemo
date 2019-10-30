import 'package:flutter/material.dart';

class AnimatedCrossFadeRoute extends StatefulWidget {
  @override
  _AnimatedCrossFadeRouteState createState() {
    // TODO: implement createState
    return _AnimatedCrossFadeRouteState();
  }
}

class _AnimatedCrossFadeRouteState extends State<AnimatedCrossFadeRoute> {
  bool _isFirst = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('AnimatedCrossFade'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                constraints: BoxConstraints.tight(Size(400, 500)),
                alignment: Alignment.center,
                child: AnimatedCrossFade(
                  sizeCurve: Curves.easeInOut,
                    alignment: Alignment.topLeft,
                    firstChild: Container(
                      constraints: BoxConstraints.tight(Size(100, 100)),
                      color: Colors.red,
                    ),
                    secondChild: Container(
                        constraints: BoxConstraints.tight(Size(300, 300)),
                        color: Colors.blue),
                    crossFadeState: _isFirst
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: Duration(seconds: 1),
                  layoutBuilder: (Widget topChild, Key topChildKey, Widget bottomChild, Key bottomChildKey){
                    return Stack(
                      fit: StackFit.loose,
                      alignment: Alignment.center,
                      children: <Widget>[
                        Positioned(
                          key: bottomChildKey,
                          child: bottomChild,
                        ),
                        Positioned(
                          key: topChildKey,
                          child: topChild,
                        )
                      ],
                    );
                  },
                ),
              ),
              RaisedButton(
                child: Text('change Container'),
                onPressed: () {
                  setState(() {
                    _isFirst = !_isFirst;
                  });
                },
              )
            ],
          ),
        ));
  }
}
