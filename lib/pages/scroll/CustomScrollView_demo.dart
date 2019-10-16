import 'package:flutter/material.dart';

class CustomScrollViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          floating: true,
          snap: true,
          leading: Icon(Icons.arrow_back),
          automaticallyImplyLeading: true,
          expandedHeight: 250.0,
          title: Text('title'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart),
              tooltip: 'Open shopping cart',
              onPressed: () {
                // handle the press
              },
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            // title: Text('title'),
            background: Image.network(
              'http://pic38.nipic.com/20140228/2457331_083845176000_2.jpg',
              fit: BoxFit.cover,
            ),
          ),
          bottom: PreferredSize(
            child: Container(
              alignment: Alignment.center,
              color: Colors.yellow,
              height: 30.0,
              width: 100.0,
              margin: EdgeInsets.only(bottom: 10.0),
              child: Text('bottom'),
            ),
            preferredSize: Size(100.0, 50.0)
          ),
          elevation: 10.0,
          forceElevated: false,
          backgroundColor: Colors.red,
          iconTheme: IconThemeData(
            color: Colors.red,
            opacity: 0.9,
            size: 25
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.green
          ),
          centerTitle: false,
          titleSpacing: 10.0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.red,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0)
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(10.0),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                      color: Colors.lightBlueAccent,
                    ),
                childCount: 15),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 5.0 / 2.0),
          ),
        ),
        SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                    title: Text('标题$index'),
                  ),
              childCount: 10),
          itemExtent: 40.0,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                    title: Text('标题$index'),
                  ),
              childCount: 10),
        ),
      ],
    );
  }
}
