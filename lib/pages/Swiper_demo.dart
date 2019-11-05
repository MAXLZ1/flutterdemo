import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class SwiperRoute extends StatefulWidget{
  @override
  _SwiperRouteState createState() {
    // TODO: implement createState
    return _SwiperRouteState();
  }
}

class _SwiperRouteState extends State<SwiperRoute>{
  List<ImageProvider> list = [
    AssetImage('assets/images/lake.jpg'),
    AssetImage('assets/images/img1.jpg'),
    AssetImage('assets/images/img2.jpg')
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('SwiperDemo'),
      ),
      body: Container(
        width: double.infinity,
        height: 250,
        child: Swiper(
          autoplayDisableOnInteraction: false,
          onIndexChanged: (index) {
            print('indexChange: $index');
          },
          index: 2,
          onTap: (index) {
            print('tap: $index');
          },
          // control: SwiperControl(),
          loop: true,
          autoplay: true,
          itemBuilder: (BuildContext context,int index){
            return Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(offset: Offset(1, 1), color: Colors.black12, spreadRadius: 3.0, blurRadius: 7.0),
                        BoxShadow(offset: Offset(-1, -1), color: Colors.black12, spreadRadius: 3.0, blurRadius: 7.0),
                        BoxShadow(offset: Offset(-1, 1), color: Colors.black12, spreadRadius: 3.0, blurRadius: 7.0),
                        BoxShadow(offset: Offset(1, -1), color: Colors.black12, spreadRadius: 3.0, blurRadius: 7.0),
                      ],
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(image: list[index],fit: BoxFit.cover)
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text('$index', style: TextStyle(color: Colors.white, fontSize: 95.0)),
                )
              ],
            );
          },
          itemCount: 3,
          fade: 0.0,
          scale: 0.0,
          curve: Curves.easeInOut,
          duration: 600,
          autoplayDelay: 5000,
          scrollDirection: Axis.horizontal,
          pagination: SwiperPagination(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30)
          ),
          viewportFraction: 0.8,
        ),
      )
    );
  }
}