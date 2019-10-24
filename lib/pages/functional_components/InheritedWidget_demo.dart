import 'package:flutter/material.dart';

class ShareDataWidget extends InheritedWidget{
  int data;
  ShareDataWidget({@required this.data, Widget child}) : super(child: child);

  static ShareDataWidget of (BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    return oldWidget.data != data;
  }

}

class TextWidget extends StatefulWidget{
  @override
  _TextWidgetState createState () => _TextWidgetState();
}
class _TextWidgetState extends State<TextWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
        'count: ' + ShareDataWidget.of(context).data.toString()
    );
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('change');
  }
}

class TestShareDataWidgetDemo extends StatefulWidget{
  @override
  _TestShareDataWidgetDemoState createState() => _TestShareDataWidgetDemoState();
}

class _TestShareDataWidgetDemoState extends State<TestShareDataWidgetDemo> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: ShareDataWidget(
        data: count,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextWidget(),
            RaisedButton(
              child: Text('add count'),
              onPressed: () => setState(()  => count++),
            )
          ],
        ),
      ),
    );
  }
}