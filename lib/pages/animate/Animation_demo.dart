import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class AnimationRoute extends StatefulWidget {
  @override
  _AnimationRouteState createState() {
    // TODO: implement createState
    return _AnimationRouteState();
  }
}

class _AnimationRouteState extends State<AnimationRoute>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController controller;
  Curve _selectItem;
  Map<String, Curve> map = {
    'linear': Curves.linear,
    'decelerate': Curves.decelerate,
    'fastLinearToSlowEaseIn': Curves.fastLinearToSlowEaseIn,
    'ease': Curves.ease,
    'easeIn': Curves.easeIn,
    'easeInToLinear': Curves.easeInToLinear,
    'easeInSine': Curves.easeInSine,
    'easeInQuad': Curves.easeInQuad,
    'easeInCubic': Curves.easeInCubic,
    'easeInQuart': Curves.easeInQuart,
    'easeInQuint': Curves.easeInQuint,
    'easeInExpo': Curves.easeInExpo,
    'easeInCirc': Curves.easeInCirc,
    'easeInBack': Curves.easeInBack,
    'easeOut': Curves.easeOut,
    'linearToEaseOut': Curves.linearToEaseOut,
    'easeOutSine': Curves.easeOutSine,
    'easeOutQuad': Curves.easeOutQuad,
    'easeOutCubic': Curves.easeOutCubic,
    'easeOutQuart': Curves.easeOutQuart,
    'easeOutQuint': Curves.easeOutQuint,
    'easeOutExpo': Curves.easeOutExpo,
    'easeOutCirc': Curves.easeOutCirc,
    'easeOutBack': Curves.easeOutBack,
    'easeInOut': Curves.easeInOut,
    'easeInOutSine': Curves.easeInOutSine,
    'easeInOutQuad': Curves.easeInOutQuad,
    'easeInOutCubic': Curves.easeInOutCubic,
    'easeInOutQuart': Curves.easeInOutQuart,
    'easeInOutQuint': Curves.easeInOutQuint,
    'easeInOutExpo': Curves.easeInOutExpo,
    'easeInOutCirc': Curves.easeInOutCirc,
    'easeInOutBack': Curves.easeInOutBack,
    'fastOutSlowIn': Curves.fastOutSlowIn,
    'slowMiddle': Curves.slowMiddle,
    'bounceIn': Curves.bounceIn,
    'bounceOut': Curves.bounceOut,
    'bounceInOut': Curves.bounceInOut,
    'elasticIn': Curves.elasticIn,
    'elasticOut': Curves.elasticOut,
    'elasticInOut': Curves.elasticInOut
  };

  List<DropdownMenuItem> getDropMenuItems () {
    return map.keys.toList().map((item){
      return DropdownMenuItem(
        value: map[item],
        child: Text('$item'),
      );
    }).toList();
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectItem = map['linear'];
    controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = Tween(begin: Size(0, 0), end: Size(300.0, 200.0))
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceIn))
          ..addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 40.0),
            height: 200,
            child: Image.asset(
              'assets/images/lake.jpg',
              width: animation.value.width,
              height: animation.value.height,
            ),
          ),
          Wrap(
            runAlignment: WrapAlignment.center,
            alignment: WrapAlignment.center,
            children: <Widget>[
              DropdownButton(
                value: _selectItem,
                items: getDropMenuItems(),
                onChanged: (item){
                  setState(() {
                    _selectItem = item;
                    controller.reset();
                    animation = Tween(begin: Size(0, 0), end: Size(300.0, 200.0))
                        .animate(CurvedAnimation(parent: controller, curve: item))
                      ..addListener(() => setState(() {}));
                    controller.forward();
                  });
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
