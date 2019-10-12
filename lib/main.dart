import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import './pages/Text_demo.dart';
import './pages/TextSpan_demo.dart';
import './pages/DefaultTextStyle_demo.dart';
import './pages/Button_demo.dart';
import './pages/Image_demo.dart';
import './pages/Icon_demo.dart';
import './pages/Form_widget_demo.dart';
import './pages/Form_demo.dart';
import './pages/container/Center_demo.dart';
import './pages/container/Padding_demo.dart';
import './pages/container/AnimatedPadding_demo.dart';
import './pages/container/Container_demo.dart';
import './pages/container/SizedBox_demo.dart';
import './pages/container/SizedOverflowBox_demo.dart';
import './pages/container/OverflowBox_demo.dart';
import './pages/container/LimtedBox_demo.dart';
import './pages/container/ConstrainedBox_demo.dart';
import './pages/container/DecoratedBox_demo.dart';
import './pages/container/FittedBox_demo.dart';
import './pages/container/RotateBox_demo.dart';
import './pages/container/Transform_demo.dart';
import './pages/container/Align_demo.dart';
import './pages/layout/Row_demo.dart';
import './pages/layout/Column_demo.dart';
import './pages/layout/Flex_demo.dart';
import './pages/layout/Wrap_demo.dart';
import './pages/layout/Flow_demo.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      theme: ThemeData(
//        brightness: Brightness.light,
//        accentColor: Colors.green,
//        primaryColor: Colors.cyanAccent
//      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: FlowDemo(),
      ),
    );
  }
}

class MyBody extends StatefulWidget{
  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody>{
  bool flag = false;
  TapGestureRecognizer tapGestureRecognizer = new TapGestureRecognizer();

  @override
  void dispose() {
    super.dispose();
    tapGestureRecognizer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          style: TextStyle(
            fontSize: 20.0
          ),
          children: [
            TextSpan(
              text: 'Home:'
            ),
            TextSpan(
              text: 'https://www.baidu.com',
              style: TextStyle(
                color: flag ? Colors.red : Colors.blue
              ),
              recognizer: tapGestureRecognizer..onTap = (){
                setState(() {
                  flag = true;
                });
              }
            )
          ]
        )
      ),
    );
  }
}