import 'package:flutter/material.dart';
import 'dart:math';

class GridViewDdemo extends StatelessWidget {
  ScrollController _control =  new ScrollController();
  @override
  Widget build(BuildContext context) {
    _control.addListener((){
      print(_control.offset);
    });
    // TODO: implement build
    return getGridViewFive();
  }

  Widget getGridViewOne() {
    return GridView(
      padding: EdgeInsets.all(10.0),
      primary: false,
      shrinkWrap: false,
      controller: _control,
      physics: BouncingScrollPhysics(), // 回弹效果
      cacheExtent: 200.0,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150.0,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 20.0,
        childAspectRatio: 3.0/2.0
      ),
//      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//        crossAxisCount: 3,
//        mainAxisSpacing: 10.0,
//        crossAxisSpacing: 20.0,
//        childAspectRatio: 3.0/2.0
//      ),
      children: getMoreContainer(50),
    );
  }

  Widget getGridViewTwo() {
    return GridView.count(
      scrollDirection: Axis.vertical,
      crossAxisCount: 4,
      padding: EdgeInsets.all(10.0),
      mainAxisSpacing: 20.0,
      crossAxisSpacing: 10.0,
      childAspectRatio: 3.0/2.0,
      children: getMoreContainer(50),
    );
  }

  Widget getGridViewThree() {
    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 20.0,
        childAspectRatio: 3.0/2.0
      ),
      itemCount: 50,
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          color: Color.fromRGBO(
              Random().nextInt(255),
              Random().nextInt(255),
              Random().nextInt(255),
              1.0
          ),
          child: Text(
            '$index',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20
            ),
          ),
        );
      },
    );
  }

  Widget getGridViewFour() {
    return GridView.custom(
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 20.0,
        childAspectRatio: 3.0/2.0
      ),
      childrenDelegate: SliverChildBuilderDelegate((content, index){
        return Container(
          alignment: Alignment.center,
          color: Color.fromRGBO(
              Random().nextInt(255),
              Random().nextInt(255),
              Random().nextInt(255),
              1.0
          ),
          child: Text(
            '$index',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20
            ),
          ),
        );
      },
      childCount: 50
      ),
    );
  }

  Widget getGridViewFive() {
    return GridView.extent(
      maxCrossAxisExtent: 100.0,
      children: getMoreContainer(50),
      mainAxisSpacing: 20.0,
      crossAxisSpacing: 10.0,
      padding: EdgeInsets.all(10.0),
    );
  }

  List<Widget> getMoreContainer(int length) {
    List<Widget> list = List();
    for (int i = 0; i < length; i++) {
      list.add(Container(
        alignment: Alignment.center,
        color: Color.fromRGBO(
          Random().nextInt(255),
          Random().nextInt(255),
          Random().nextInt(255),
          1.0
        ),
        child: Text(
          '$i',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20
          ),
        ),
      ));
    }
    return list;
  }
}
