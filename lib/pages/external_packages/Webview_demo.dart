import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewRoute extends StatefulWidget{
  @override
  _WebViewRouteState createState() => _WebViewRouteState();
  
}

class _WebViewRouteState extends State{
  WebViewController _controller;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('webview_demo'),
      ),
      body: Container(
        child: WebView(
          onWebViewCreated: (WebViewController controller) {
            _controller = controller;
          },
          javascriptChannels: <JavascriptChannel>[
            JavascriptChannel(name: 'Toast', onMessageReceived: (JavascriptMessage message) {
              print(message.message);
            })
          ].toSet(),
          initialUrl: 'http://127.0.0.1:8080/index.html',
          javascriptMode: JavascriptMode.unrestricted,
          navigationDelegate: (NavigationRequest request) {
            if (request.url.startsWith('http://127.0.0.1')) {
              print('http://127.0.0.1被拦截');
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
          onPageFinished: (str) {
            print(str);
            String js = 'let elem = document.createElement("div");elem.textContent = "添加";document.body.appendChild(elem);';
            _controller.evaluateJavascript(js);
          },
        ),
      ),
    );
  }
}