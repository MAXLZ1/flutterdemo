import 'package:flutter/material.dart';

class NotificationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return NotificationListener(
      onNotification: (notification) {
        print(notification.metrics.pixels); // 当前滚动位置
        print(notification.metrics.maxScrollExtent); // 滚动最大范围
        switch (notification.runtimeType) {
          case ScrollStartNotification:
            print("开始滚动");
            break;
          case ScrollUpdateNotification:
            print("正在滚动");
            break;
          case ScrollEndNotification:
            print("滚动停止");
            break;
          case OverscrollNotification:
            print("滚动到边界");
            break;
        }
        return true;
      },
      child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("$index"),
            );
          }),
    );
  }
}

class MyNotification extends Notification {
  final String msg;

  MyNotification(this.msg);
}

class NotificationRoute extends StatefulWidget {
  @override
  _NotificationRouteState createState() {
    // TODO: implement createState
    return _NotificationRouteState();
  }
}

class _NotificationRouteState extends State<NotificationRoute> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return NotificationListener(
      onNotification: (MyNotification notification) {
        setState(() {
          text = notification.msg;
        });
        return false;
      },
      child: Center(
        child: Column(
          children: <Widget>[
            Text('msg: $text'),
            Builder(
              builder: (context) => RaisedButton(
                onPressed: () => MyNotification('接受到通知').dispatch(context),
                child: Text('发送通知'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
