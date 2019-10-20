import 'package:flutter/material.dart';
import '../../pages/layout/Flex_demo.dart';
import '../../pages/layout/Wrap_demo.dart';
import '../../pages/layout/Flow_demo.dart';
import '../../pages/layout/Row_demo.dart';
class BottomNavigatorBarDemo extends StatefulWidget{
  @override
  _BottomNavigatorBarDemoState createState() => _BottomNavigatorBarDemoState();
}

class _BottomNavigatorBarDemoState extends State<BottomNavigatorBarDemo>{
  int _currentIndex;
  var _list;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _list = [FlexDemo(), WrapDemo(), FlowDemo(), RowDemo()];
    _currentIndex = 0;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      body: _list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('发现'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email),
            title: Text('信息'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('我的'),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        // selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        elevation: 8.0,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.yellow,
        backgroundColor: Colors.white,
        iconSize: 24.0,
        selectedFontSize: 13.0,
        unselectedFontSize: 11.0,
      ),
    );
  }
}