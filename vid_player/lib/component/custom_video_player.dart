
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vid_player/component/custom_icon_button.dart';

import 'package:video_player/video_player.dart';
import 'dart:io';

class CustomVideoPlayer extends StatefulWidget{

  //선택한 동영상을 저장할 변수
  //Xfile은 ImagePicker로 영상 또는 이미지를 선택했을때 반환하는 타입

  final XFile video;
  final GestureTapCallback onNewVideoPressed;


  const CustomVideoPlayer({
    required this.video,
    required this.onNewVideoPressed,
    Key? key,

}):super(key: key);

  State<CustomVideoPlayer> createState()=>_CustomVideoPlayer();
}

class _CustomVideoPlayer extends State<CustomVideoPlayer>{

  //동영상을 조작할 컨트롤러
  VideoPlayerController? videoPlayerController;
  //동영상 조작하는 아이콘을 보일지 여부
  bool showControls=false;

  @override
  void didUpdateWidget(covariant CustomVideoPlayer oldWidget){
    super.didUpdateWidget(oldWidget);
    if(oldWidget.video.path!=widget.video.path){
      initalizeController();
    }
  }

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

    //컨트롤러의 실행이 변경될때마다 실행할 함수 등록
    videoController!.addListener(videoControllerListenr);

    setState(() {
      this.videoPlayerController=videoController;
    });
  }
  void videoControllerListenr(){
    setState(() {

    });
  }
  @override
  void dispose(){
    videoPlayerController?.removeListener(videoControllerListenr);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {


    if(videoPlayerController==null){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return GestureDetector(
      onTap: (){
        setState(() {
          showControls=!showControls;
        });
      },
      child:
      AspectRatio(//동영상 비율에 따른 화면 렌더링
        aspectRatio: videoPlayerController!.value.aspectRatio,
        child: Stack(
          children: [
            VideoPlayer(
              videoPlayerController!,
            ),
            if(showControls)
              Container(
                color: Colors.black.withOpacity(0.5),
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
            ),
            if(showControls)
              Align(
                alignment: Alignment.topRight,
                child: CustomIconButton(
                  onPressed: widget.onNewVideoPressed,
                  iconData: Icons.photo_camera_back_rounded,
                ),
              ),
            if(showControls)
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomIconButton(
                        onPressed: onReversedPressed,
                        iconData: Icons.rotate_left
                    ),
                    CustomIconButton(
                      onPressed: onPlayPressed,
                      iconData: videoPlayerController!.value.isPlaying?
                      Icons.pause: Icons.play_arrow,
                    ),
                    CustomIconButton(
                      onPressed:onForwardPressed,
                      iconData: Icons.rotate_right,
                    ),


                  ],
                ),
              ),
          ],
        ),
      ) ,
    );

      AspectRatio(//동영상 비율에 따른 화면 렌더링
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
          ),
          Align(
            alignment: Alignment.topRight,
            child: CustomIconButton(
              onPressed: widget.onNewVideoPressed,
              iconData: Icons.photo_camera_back_rounded,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomIconButton(
                    onPressed: onReversedPressed,
                    iconData: Icons.rotate_left
                ),
                CustomIconButton(
                    onPressed: onPlayPressed,
                    iconData: videoPlayerController!.value.isPlaying?
                        Icons.pause: Icons.play_arrow,
                ),
                CustomIconButton(
                    onPressed:onForwardPressed,
                    iconData: Icons.rotate_right,
                ),


              ],
            ),
          ),
        ],
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

  void onReversedPressed(){
    final currentPosition= videoPlayerController!.value.position;//현재 실행중인 위치
    Duration position=Duration();
    if(currentPosition.inSeconds>3){ //현재위치가 3초보다 길때만 3초 빼기
      position=currentPosition-Duration(seconds: 3);
    }
    videoPlayerController!.seekTo(position);
  }

  void onForwardPressed(){
    final maxPosition =videoPlayerController!.value.duration;
    final currentPosition=videoPlayerController!.value.position;

    Duration position=maxPosition;

    if((maxPosition-Duration(seconds: 3)).inSeconds>currentPosition.inSeconds){
      position=currentPosition+Duration(seconds: 3);
      videoPlayerController!.seekTo(position);
    }

  }
  void onPlayPressed(){
    if(videoPlayerController!.value.isPlaying){
      videoPlayerController!.pause();

    }else{
      videoPlayerController!.play();
    }
  }


}