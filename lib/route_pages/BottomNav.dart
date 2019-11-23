import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './PageOne.dart';

class BottomNav extends StatefulWidget{
  @override
  _BottomNavState createState() {
    // TODO: implement createState
    return _BottomNavState();
  }
}
class _BottomNavState extends State<BottomNav>{
  int _currentIndex = 0;
  List list = [Home(), Search(), Setting()];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter route'),
      ),
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('首页')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('搜索')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('设置')
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: RaisedButton(
        child: Text('跳转至PageOne'),
        onPressed: () {
          // Navigator.pushNamed(context, '/pageone', arguments: '来自home页面的参数');
          Navigator.pushNamedAndRemoveUntil(context, '/pageone', ModalRoute.withName('/'), arguments: '来自home页面的参数');
        },
      ),
    );
  }
}
class Search extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text('search'),
    );
  }
}
class Setting extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text('setting'),
    );
  }
}