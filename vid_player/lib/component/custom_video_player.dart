
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:video_player/video_player.dart';
import 'dart:io';

class CustomVideoPlayer extends StatefulWidget{

  //선택한 동영상을 저장할 변수
  //Xfile은 ImagePicker로 영상 또는 이미지를 선택했을때 반환하는 타입

  final XFile video;

  const CustomVideoPlayer({
    required this.video,
    Key? key,

}):super(key: key);

  State<CustomVideoPlayer> createState()=>_CustomVideoPlayer();
}

class _CustomVideoPlayer extends State<CustomVideoPlayer>{
  //동영상을 조작할 컨트롤러
  VideoPlayerController? videoPlayerController;
  @override
  void initState(){
    super.initState();
    initalizeController();//컨틀ㄹ러 초기화

  }
  initalizeController() async{
    final videoController=VideoPlayerController.file(
      File(widget.video.path),
    );

    await videoController.initialize();

    setState(() {
      this.videoPlayerController=videoController;
    });
  }


  @override
  Widget build(BuildContext context) {

    if(videoPlayerController==null){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return AspectRatio(//동영상 비율에 따른 화면 렌더링
      aspectRatio: videoPlayerController!.value.aspectRatio,
      child: Stack(
        children: [
          VideoPlayer(
            videoPlayerController!,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Slider(
              onChanged: (double val){
                videoPlayerController!.seekTo(
                  Duration(seconds:val.toInt()),
                );
              },
              value: videoPlayerController!.value.position.inSeconds.toDouble(),
              min: 0,
              max: videoPlayerController!.value.duration.inSeconds.toDouble(),
            ),
          )
        ],
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }


}