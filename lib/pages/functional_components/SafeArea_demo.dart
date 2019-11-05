import 'package:flutter/material.dart';

class SafeAreaRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('SafeArea'),
        ),
      ),
    );
  }
}