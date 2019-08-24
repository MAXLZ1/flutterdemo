import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class ImageDemo extends StatefulWidget{
  @override
  _ImageDemoState createState() => _ImageDemoState();
}

class _ImageDemoState extends State<ImageDemo>{
  Uint8List bytes;
  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/images/lake.jpg').then((data){
      setState(() {
        bytes = data.buffer.asUint8List();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              // image: AssetImage('assets/images/lake.jpg'),
              image: NetworkImage('http://pic33.nipic.com/20131007/13639685_123501617185_2.jpg'),
              // image: FileImage(File('/Users/maxlz/Desktop/StudyData/Flutter/flutterdemo/assets/images/lake.jpg')),
              // image: bytes == null ? null : MemoryImage(bytes),
//              frameBuilder: (context, child, frame, wasSynchronouslyLoaded){
//                if (wasSynchronouslyLoaded){
//                  return child;
//                }
//                return AnimatedOpacity(
//                  child: child,
//                  opacity: frame == null ? 0 : 1,
//                  duration: const Duration(seconds: 4),
//                  curve: Curves.easeOut,
//                );
//              },
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress){
                if (loadingProgress == null)
                  return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                  : null,
                  ),
                );
              },
              fit: BoxFit.contain,
              height: 300,
              width: 350,
              //color: Colors.blue,
              //colorBlendMode: BlendMode.exclusion,
              filterQuality: FilterQuality.high,
              alignment: Alignment.center,
              repeat: ImageRepeat.noRepeat,
              matchTextDirection: false,
              gaplessPlayback: false,
              semanticLabel: '这是一个湖',
              // centerSlice: Rect.fromLTRB(0, 10, 0, 10),
            ),
          ],
        )
      ],
    );
  }
}

//class ImageDemo extends StatelessWidget{
//  Widget build(BuildContext context) {
//    return DecoratedBox(
//      decoration: BoxDecoration(
//        color: Colors.white,
//        border: Border.all(),
//        borderRadius: BorderRadius.circular(20),
//      ),
//      child: Image.network(
//        'http://pic33.nipic.com/20131007/13639685_123501617185_2.jpg',
//        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
//          if (loadingProgress == null)
//            return child;
//          return Center(
//            child: CircularProgressIndicator(
//              value: loadingProgress.expectedTotalBytes != null
//                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
//                  : null,
//            ),
//          );
//        },
//      ),
//    );
//  }
//}
