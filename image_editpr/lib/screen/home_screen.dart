
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_editpr/component/main_app_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget{
  const HomeScreen ({Key? key}):super(key: key);
  @override
  State<HomeScreen> createState()=>_HomeState();


}

class _HomeState extends State<HomeScreen>{
  XFile? image;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack( //스크린에 Body, Appbar, Footer 순서대로 쌓을 준비
        fit:  StackFit.expand,//자식 위젯들 최대 크기로 펼치기
        children: [
          renderBody(),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: MainAppBar(
              onPickImage: onPickImage,
              onSaveImage: onSaveImage,
              onDeleteItem: onDeleteImage,
            ) ,
          ),
          //MainAppBar 좌우 위끝에 정렬
        ],

      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
  Widget renderBody(){
    if(image!=null){
      return Positioned.fill(
          child: InteractiveViewer(
            child: Image.file(
              File(image!.path),
              fit: BoxFit.cover,
            ),
          ),
      );
    }else{
      return Center(
        child:TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.grey,
            foregroundColor: Colors.grey,
          ),
          onPressed: onPickImage,
          child: Text('이미지 선택하기'),

          ),
        );
    }
  }

  void onPickImage()async{
    final image=await ImagePicker().
    pickImage(source: ImageSource.gallery);
    setState(() {
      this.image=image;
    });
  }
  void onSaveImage(){}
  void onDeleteImage(){}



}