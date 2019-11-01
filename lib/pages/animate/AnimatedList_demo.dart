import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedListRoute extends StatefulWidget{
  _AnimatedListRouteState createState() => _AnimatedListRouteState();
}

class _AnimatedListRouteState extends State<AnimatedListRoute>{
  final _listKey = GlobalKey<AnimatedListState>();
  List<int> _data;
  Tween<Offset> _tween = Tween<Offset>(begin: Offset(1,0), end: Offset(0,0));
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _data = [12,34,43,54];
  }

  Widget myListItem(BuildContext context, String text, Animation animation) {
    return SlideTransition(
      position: animation.drive(CurveTween(curve: Curves.bounceOut)).drive(_tween),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        constraints: BoxConstraints.tight(Size(double.infinity, 70)),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('$text', style: TextStyle(color: Colors.white),),
            IconButton(
              icon: Icon(Icons.delete_forever, color: Colors.white,),
              onPressed: (){
                int index = _data.indexOf(int.parse(text));
                _data.removeAt(index);
                AnimatedList.of(context).removeItem(index, (context, animation) => myListItem(context, text, animation), duration: Duration(seconds: 1));
              },
            )
          ],
        ),
        color: Colors.primaries[int.parse(text) % Colors.primaries.length],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedListState'),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: AnimatedList(
              key: _listKey,
              itemBuilder: (context, index, animation) => myListItem(context,_data[index].toString(), animation),
              initialItemCount: _data.length,
            ),
          ),
          Positioned(
            bottom: 30,
            right: 10,
            child: FloatingActionButton(
              heroTag: 'remove',
              onPressed: () {
                int data = _data.last;
                int index = _data.length - 1;
                _data.remove(data);
                _listKey.currentState.removeItem(index, (context, animation) => myListItem(context, data.toString(), animation), duration: Duration(seconds: 1));
              },
              child: Icon(Icons.remove),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 70,
            child: FloatingActionButton(
              heroTag: 'add',
              onPressed: () {
                int num = Random().nextInt(100);
                _data.add(num);
                int index = _data.lastIndexOf(num);
                _listKey.currentState.insertItem(index, duration: Duration(seconds: 1));
              },
              child: Icon(Icons.add),
            ),
          )
        ],
      )
    );
  }
}