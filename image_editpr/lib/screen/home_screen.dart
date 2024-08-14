
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_editpr/component/emoticon_sticker.dart';
import 'package:image_editpr/component/main_app_bar.dart';
import 'package:image_editpr/component/footer.dart';
import 'package:image_editpr/model/sticker_model.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:uuid/uuid.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen ({Key? key}):super(key: key);
  @override
  State<HomeScreen> createState()=>_HomeState();


}

class _HomeState extends State<HomeScreen>{
  XFile? image;
  Set<StickerModel> stickers={};
  String? selectedId;


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
          if(image!=null)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Footer(
                onEmoticonTap: onEmoticonTap,
              ),
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
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.file(
                  File(image!.path),
                  fit: BoxFit.cover,
                ),
                ...stickers.map(
                    (sticker)=>Center( //최초스티커 선택시 중앙에 배치
                      child: EmoticonSticker(
                        key: ObjectKey(sticker.id),
                        onTransForm: (){
                          onTransForm(sticker.id);
                        },
                        imgPath: sticker.imgPath,
                        isSelected: selectedId==sticker.id,
                      ),
                    ),
                ),
              ],
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

  void onTransForm(String id){
    //스티커가 변형 될따마다 변형중인
    //스티커를 현재 선택한 스티커로 지정
    setState(() {
      selectedId=id;
    });
  }

  void onEmoticonTap(int index)async{
    setState(() {
      stickers={
        ...stickers,
        StickerModel(
          id:Uuid().v4(),//스티커의 고유 ID
          imgPath: 'asset/img/emoticon_$index.png',
        ),
      };
    });
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