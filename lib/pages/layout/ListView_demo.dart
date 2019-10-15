import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ListViewDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return getListViewFour();
  }

  ListView getListViewOne () {
    return ListView(
        children: getList(20)
    );
  }

  ListView getListViewTwo () {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text('标题$index'),
        subtitle: Text('副标题$index'),
        trailing: Icon(Icons.keyboard_arrow_right),
        isThreeLine: false,
        dense: false,
        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        enabled: true,
        onTap: (){
          print('tap');
        },
        onLongPress: () {
          print('longPress');
        },
        selected: index.isEven ? true : false,
        leading: CircleAvatar(
            backgroundImage: NetworkImage('http://pic31.nipic.com/20130710/12018626_110428606000_2.jpg')
        ),
      ),
      itemCount: 30,
    );
  }

  ListView getListViewThree () {
    return ListView.separated(
      itemBuilder: (context, index) => ListTile(
        title: Text('标题$index'),
        subtitle: Text('副标题$index'),
        trailing: Icon(Icons.keyboard_arrow_right),
        isThreeLine: false,
        dense: false,
        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        enabled: true,
        onTap: (){
          print('tap');
        },
        onLongPress: () {
          print('longPress');
        },
        selected: index.isEven ? true : false,
        leading: CircleAvatar(
            backgroundImage: NetworkImage('http://pic31.nipic.com/20130710/12018626_110428606000_2.jpg')
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
      separatorBuilder: (context, index) => Divider(
        color: Colors.grey[400],
        height: 1.0,
        thickness: 1.0,
      ),
      itemCount: 20,
    );
  }

  ListView getListViewFour () {
    return ListView.custom(
      childrenDelegate: SliverChildBuilderDelegate((context, index) => ListTile(
        title: Text('标题$index'),
        subtitle: Text('副标题$index'),
        trailing: Icon(Icons.keyboard_arrow_right),
        isThreeLine: false,
        dense: false,
        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        enabled: true,
        onTap: (){
          print('tap');
        },
        onLongPress: () {
          print('longPress');
        },
        selected: index.isEven ? true : false,
        leading: CircleAvatar(
            backgroundImage: NetworkImage('http://pic31.nipic.com/20130710/12018626_110428606000_2.jpg')
        ),
      ),
      childCount: 30),
    );
  }

  List<Widget> getList (int length) {
    List<Widget> list = List();
    for (int i = 0; i < length; i++) {
      list.add(ListTile(
        title: Text('标题$i'),
        subtitle: Text('副标题$i'),
        trailing: Icon(Icons.keyboard_arrow_right),
        isThreeLine: false,
        dense: false,
        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        enabled: true,
        onTap: (){
          print('tap');
        },
        onLongPress: () {
          print('longPress');
        },
        selected: i.isEven ? true : false,
        leading: CircleAvatar(
          backgroundImage: NetworkImage('http://pic31.nipic.com/20130710/12018626_110428606000_2.jpg')
        ),
      ));
    }
    return list;
  }
}

class InfiniteListDemo extends StatefulWidget{
  @override
  _InfiniteListDemoState createState() => _InfiniteListDemoState();

}

class _InfiniteListDemoState extends State<InfiniteListDemo>{
  static const loadingTag = '#loading#';
  List<String> _words = <String>[loadingTag];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWords(30);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index){
        if (_words[index] == loadingTag) { // 尾部
          if (_words.length - 1 < 100) {
            //获取数据
            getWords(10);
            //加载时显示loading
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0)
              ),
            );
          } else {
            //已经加载了100条数据，不再获取数据。
            return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Text("没有更多了", style: TextStyle(color: Colors.grey),)
            );
          }
        }
        return ListTile(
          title: Text(_words[index]),
        );
      },
      separatorBuilder: (context, index) => Divider(
        color: Colors.grey[400],
        height: 1.0,
        thickness: 1.0,
        indent: 15.0,
        endIndent: 15.0,
      ),
      itemCount: _words.length,
    );
  }

  void getWords(int length) {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(_words.length - 1 , generateWordPairs().take(length).map((e) => e.asPascalCase).toList());
      setState(() {

      });
    });
  }

}