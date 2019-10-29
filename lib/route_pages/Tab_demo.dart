import 'package:flutter/material.dart';

class TabDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 7,
      initialIndex: 3,
      child: Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            title: TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: '推荐1'),
                Tab(text: '推荐2'),
                Tab(text: '推荐3'),
                Tab(text: '推荐5'),
                Tab(text: '推荐4'),
                Tab(text: '推荐6'),
                Tab(text: '推荐7'),
              ],
              indicatorWeight: 2,
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 15.0),
            ),
            automaticallyImplyLeading: false,
          ),
          preferredSize: Size.fromHeight(50.0),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text('推荐1'),
                ),
                ListTile(
                  title: Text('推荐1'),
                ),
                ListTile(
                  title: Text('推荐1'),
                ),
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text('推荐2'),
                ),
                ListTile(
                  title: Text('推荐2'),
                ),
                ListTile(
                  title: Text('推荐2'),
                ),
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text('推荐3'),
                ),
                ListTile(
                  title: Text('推荐3'),
                ),
                ListTile(
                  title: Text('推荐3'),
                ),
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text('推荐4'),
                ),
                ListTile(
                  title: Text('推荐4'),
                ),
                ListTile(
                  title: Text('推荐4'),
                ),
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text('推荐5'),
                ),
                ListTile(
                  title: Text('推荐5'),
                ),
                ListTile(
                  title: Text('推荐5'),
                ),
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text('推荐6'),
                ),
                ListTile(
                  title: Text('推荐6'),
                ),
                ListTile(
                  title: Text('推荐6'),
                ),
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text('推荐7'),
                ),
                ListTile(
                  title: Text('推荐7'),
                ),
                ListTile(
                  title: Text('推荐7'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

///
/// 使用TabController
///
class TabControllerDemo extends StatefulWidget{
  @override
  _TabControllerDemoState createState() {
    // TODO: implement createState
    return _TabControllerDemoState();
  }
}

class _TabControllerDemoState extends State<TabControllerDemo> with SingleTickerProviderStateMixin{
  final List<Tab> tabs = [
    Tab(text: '推荐1',),
    Tab(text: '推荐2',),
    Tab(text: '推荐3',),
  ];
  TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TabBar(
          tabs: tabs,
          controller: _controller,
        ),
      ),
      body: TabBarView(
        // 禁止手势滑动
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
        children: tabs.map((Tab tab) => Center(
            child: Text(tab.text.toString()),
          )).toList(),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}