import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextSpanDemo extends StatelessWidget {
  TapGestureRecognizer tapGestureRecognizer = new TapGestureRecognizer();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text.rich(TextSpan(children: [
            TextSpan(text: 'Hello ', style: TextStyle(color: Colors.blue)),
            TextSpan(
                text: 'world!',
                style: TextStyle(color: Colors.green, fontSize: 20.0))
          ])),
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text.rich(TextSpan(children: [
              TextSpan(
                text: 'http://',
              ),
              TextSpan(
                  text: 'www.baidu.com',
                  children: [
                    TextSpan(
                      text: 'ddd'
                    )
                  ],
                  style: TextStyle(color: Colors.green, fontSize: 20.0),
                  recognizer: tapGestureRecognizer..onTap = (){
                    print('www.baidu.com');
                  }
              )
            ])),
          ],
        )
      ],
    );
  }
}
