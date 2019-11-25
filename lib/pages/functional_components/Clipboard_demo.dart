import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ClipboardRoute extends StatefulWidget{
  @override
  _ClipboardRouteState createState() => _ClipboardRouteState();
}

class _ClipboardRouteState extends State<ClipboardRoute> {
  String _str = '被复制的文字';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Clipboard'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(_str),
            RaisedButton(
              child: Text('复制内容'),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: _str));
              },
            ),
            Builder(
              builder: (context) {
                return RaisedButton(
                  child: Text('获取复制的内容'),
                  onPressed: () async {
                    ClipboardData data = await Clipboard.getData(Clipboard.kTextPlain);
                    if (data != null) {
                      Scaffold.of(context).removeCurrentSnackBar();
                      Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text(data.text),)
                      );
                    }
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}