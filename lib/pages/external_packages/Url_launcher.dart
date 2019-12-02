import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherRoute extends StatelessWidget{
  
  _launchURL() async {
    const url = 'https://www.baidu.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  
  _call() async{
    const phone = '18866951152';
    print(await canLaunch(phone));
    await launch('tel:$phone');
  }
  @override
  Widget build(BuildContext context) {
    
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('url_launcher'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('在默认浏览器中打开百度'),
              onPressed: _launchURL,
            ),
            RaisedButton(
              child: Text('打电话'),
              onPressed: _call,
            )
          ]
        ),
      )
    );
  }
}