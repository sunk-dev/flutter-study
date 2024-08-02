


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//웹뷰플러그인 임포트
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget{

  //const 생성자
  HomeScreen({Key?key}):super(key:key);//const키워드 삭제
  WebViewController? controller; //컨트롤러 변수 생성
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //앱바 위젯 추가
        backgroundColor: Colors.orange,
        //앱 타이틀 설정
        title: Text('code Factory'),
        centerTitle: true,

        //AppBar의 actions 매개변수
        actions: [
          IconButton(onPressed: (){
            if(controller!=null){
              controller!.loadUrl('https://blog.codefactory.ai');
            }
          },
          icon: Icon(
            Icons.home,
          ),)
        ],
      ),
      body: WebView(
        onWebViewCreated: (WebViewController controller){
          this.controller=controller; //위젯에 컨트롤러 저장
        },
        initialUrl: 'https://blog.codefactory.ai',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}