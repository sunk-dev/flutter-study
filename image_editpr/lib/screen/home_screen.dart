
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_editpr/component/main_app_bar.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen ({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack( //스크린에 Body, Appbar, Footer 순서대로 쌓을 준비
        fit:  StackFit.expand,//자식 위젯들 최대 크기로 펼치기
        children: [
          //MainAppBar 좌우 위끝에 정렬
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: MainAppBar(
              onPickImage: onPickImage,
              onSaveImage: onSaveImage,
              onDeleteItem: onDeleteImage,
            ),
          ),
        ],

      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

  void onPickImage(){}
  void onSaveImage(){}
  void onDeleteImage(){}

}