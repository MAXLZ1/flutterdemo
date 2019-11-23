import 'dart:convert';
import 'dart:io';

class NetUtil {
  static Future get(String url) async {
    try{
      HttpClient client = HttpClient();
      HttpClientRequest request = await client.getUrl(Uri.parse(url));
      HttpClientResponse response = await request.close();
      String responseBody = await response.transform(utf8.decoder).join();
      return responseBody;
    }catch(e) {
      print('请求出错：$e');
      return null;
    }
  }

  static Future post(String url, Map<String, dynamic> data) async {
    try{
      HttpClient client = HttpClient();
      HttpClientRequest request = await client.postUrl(Uri.parse(url));
      request.add(utf8.encode(json.encode(data)));
      HttpClientResponse response = await request.close();
      String responseBody = await response.transform(utf8.decoder).join();
      return responseBody;
    }catch(e){
      print('请求出错：$e');
      return null;
    }
  }
}