


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//웹뷰플러그인 임포트
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget{

  //const 생성자
  const HomeScreen({Key?key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //앱바 위젯 추가
        backgroundColor: Colors.orange,
        //앱 타이틀 설정
        title: Text('code Factory'),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: 'https://blog.codefactory.ai',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}