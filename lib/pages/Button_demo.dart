import 'package:flutter/material.dart';

class ButtonDemo extends StatefulWidget{
  @override
  _ButtonDemoState createState() => _ButtonDemoState();
}
class _ButtonDemoState extends State<ButtonDemo>{
  final buttonItems = ['item1', 'item2', 'item3', 'item4'];
  final popupMenuItems = ['menu1', 'menu2', 'menu3'];
  String _selectedItem;

  List<DropdownMenuItem> _buildDropdownMenuItem(){
    return buttonItems.map((item){
      return DropdownMenuItem(
        value: item,
        child: Text('$item'),
      );
    }).toList();
  }

  @override
  void initState() {
    _selectedItem = _buildDropdownMenuItem()[0].value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            RaisedButton(
              child: Text('RaisedButton'),
              onPressed: () => print('click RaisedButton'),
              onHighlightChanged: (item){
                print(item);
              },
              textTheme: ButtonTextTheme.accent,
              textColor: Colors.green,
              disabledTextColor: Colors.black26,
              color: Colors.orange,
              disabledColor: Colors.grey,
              highlightColor: Colors.greenAccent,
              splashColor: Colors.yellow,
              elevation: 20.0,
              focusElevation: 30.0,
              hoverElevation: 40.0,
              highlightElevation: 10.0,
              disabledElevation: 50.0,
              padding: EdgeInsets.all(10.0),
              shape: StadiumBorder(
                side: BorderSide(
                  color: Colors.blue,
                  width: 1.0,
                  style: BorderStyle.solid
                )
              ),
              clipBehavior: Clip.antiAlias,
              animationDuration: Duration(
                milliseconds: 300
              ),
              materialTapTargetSize: MaterialTapTargetSize.padded,
//              shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.circular(10.0),
//                side: BorderSide(
//                  color: Colors.blue,
//                  width: 1.0,
//                  style: BorderStyle.solid
//                )
//              ),
//              shape: CircleBorder(
//                side: BorderSide(
//                  color: Colors.blue,
//                  width: 2.0,
//                  style: BorderStyle.solid
//                )
//              )
//              shape: BeveledRectangleBorder(
//                side: BorderSide(
//                  color: Colors.blue,
//                  width: 1.0,
//                  style: BorderStyle.solid
//                ),
//                borderRadius: BorderRadius.all(
//                  Radius.circular(12.0)
//                )
//              ),
//              shape: Border.all(
//                color: Colors.blue,
//                width: 2.0,
//                style: BorderStyle.none
//              )
//              focusColor: Colors.cyanAccent,
//              hoverColor: Colors.green,
            ),
            FlatButton(
              child: Text('FlatButton'),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              splashColor: Colors.grey,
              onPressed: () => print('click FlatButton'),
            ),
            OutlineButton(
              child: Text('OutlineButton'),
              onPressed: () => print('click OutlineButton'),
            ),
            IconButton(
              alignment: Alignment.center,
              tooltip: 'tooltip',
              icon: Icon(Icons.add_box),
              onPressed: () => print('click IconButton'),
            ),
            FloatingActionButton(
              foregroundColor: Colors.red,
              mini: true,
              tooltip: 'tooltip',
              child: Icon(Icons.add),
              onPressed: () => print('click FloatingActionButton'),
            ),
            ButtonBar(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RaisedButton(
                  child: Text('ButtonBar1'),
                  onPressed: () => print('click ButtonBar1'),
                ),
                RaisedButton(
                  child: Text('ButtonBar2'),
                  onPressed: () => print('click ButtonBar2'),
                ),
              ],
            ),
            DropdownButton(
              value: _selectedItem,
              hint: Text('value为空'),
              disabledHint: Icon(Icons.home),
              elevation: 12,
              style: TextStyle(
                color: Colors.greenAccent
              ),
              underline: Container(
                height: 1.0,
                color: Colors.red,
              ),
              icon:Icon(Icons.settings),
              iconDisabledColor: Colors.grey,
              iconEnabledColor: Colors.green,
              iconSize: 20.0,
              isDense: true,
              items: _buildDropdownMenuItem(),
              onChanged: (item){
                setState(() {
                  _selectedItem = item;
                });
              },
            ),
            PopupMenuButton(
              icon: Icon(Icons.share),
              itemBuilder: (context){
                return popupMenuItems.map((item) =>
                    PopupMenuItem(
                      child: Text('$item'),
                      value: '$item',
                    )
                ).toList();
              },
              initialValue: popupMenuItems[1],
              onSelected: (item) {
                print(item);
              },
              onCanceled: (){
                print('cancel');
              },
              tooltip: 'tooltip',
              elevation: 50,
              padding: EdgeInsets.all(20.0),
              offset: Offset(-1.0, 10),
              enabled: true,
              // child: Text('下拉菜单'),
            ),
          ],
        ),
      ],
    );
  }
}