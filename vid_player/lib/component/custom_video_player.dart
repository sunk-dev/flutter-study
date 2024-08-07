import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vid_player/component/custom_icon_button.dart';

import 'package:video_player/video_player.dart';
import 'dart:io';

class CustomVideoPlayer extends StatefulWidget {
  //선택한 동영상을 저장할 변수
  //Xfile은 ImagePicker로 영상 또는 이미지를 선택했을때 반환하는 타입

  final XFile video;
  final GestureTapCallback onNewVideoPressed;

  const CustomVideoPlayer({
    required this.video,
    required this.onNewVideoPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayer();
}

class _CustomVideoPlayer extends State<CustomVideoPlayer> {
  //동영상을 조작할 컨트롤러
  VideoPlayerController? videoController;

  //동영상 조작하는 아이콘을 보일지 여부
  bool showControls = false;

  @override
  void didUpdateWidget(covariant CustomVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.video.path != widget.video.path) {
      initalizeController();
    }
  }

  @override
  void initState() {
    super.initState();
    initalizeController(); //컨틀ㄹ러 초기화
  }

  initalizeController() async {
    final videoController = VideoPlayerController.file(
      File(widget.video.path),
    );

    await videoController.initialize();

    //컨트롤러의 실행이 변경될때마다 실행할 함수 등록
    videoController!.addListener(videoControllerListenr);

    setState(() {
      this.videoController = videoController;
    });
  }

  void videoControllerListenr() {
    setState(() {});
  }

  @override
  void dispose() {
    videoController?.removeListener(videoControllerListenr);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (videoController == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          showControls = !showControls;
        });
      },
      child: AspectRatio(
        //동영상 비율에 따른 화면 렌더링
        aspectRatio: videoController!.value.aspectRatio,
        child: Stack(
          children: [
            VideoPlayer(
              videoController!,
            ),
            if (showControls)
              Container(
                color: Colors.black.withOpacity(0.5),
              ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    renderTimeTextFromDuration(
                      videoController!.value.position,
                    ),
                    Expanded(
                      child: Slider(
                        onChanged: (double val) {
                          videoController!.seekTo(
                            Duration(seconds: val.toInt()),
                          );
                        },
                        value: videoController!.value.position.inSeconds
                            .toDouble(),
                        min: 0,
                        max: videoController!.value.duration.inSeconds
                            .toDouble(),
                      ),
                    ),
                    renderTimeTextFromDuration(
                      videoController!.value.duration,
                    ),
                  ],
                ),
              ),
            ),
            if (showControls)
            Align(
              alignment: Alignment.topRight,
              child: CustomIconButton(
                onPressed: widget.onNewVideoPressed,
                iconData: Icons.photo_camera_back,
              ),
            ),
            if (showControls)
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomIconButton(
                      onPressed: onReversedPressed,
                      iconData: Icons.rotate_left),
                  CustomIconButton(
                    onPressed: onPlayPressed,
                    iconData: videoController!.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                  ),
                  CustomIconButton(
                    onPressed: onForwardPressed,
                    iconData: Icons.rotate_right,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    throw UnimplementedError();
  }
  Widget renderTimeTextFromDuration(Duration duration){
    return Text(
      '${duration.inMinutes.toString().padLeft(2,'0')}:${(duration.inSeconds%60).toString().padLeft(2,'0')}',
      style: TextStyle(
        color: Colors.white,
      ),

    );

  }

  void onReversedPressed() {
    final currentPosition = videoController!.value.position; //현재 실행중인 위치
    Duration position = Duration();
    if (currentPosition.inSeconds > 3) {
      //현재위치가 3초보다 길때만 3초 빼기
      position = currentPosition - Duration(seconds: 3);
    }
    videoController!.seekTo(position);
  }

  void onForwardPressed() {
    final maxPosition = videoController!.value.duration;
    final currentPosition = videoController!.value.position;

    Duration position = maxPosition;

    if ((maxPosition - Duration(seconds: 3)).inSeconds >
        currentPosition.inSeconds) {
      position = currentPosition + Duration(seconds: 3);

    }
    videoController!.seekTo(position);
  }

  void onPlayPressed() {
    if (videoController!.value.isPlaying) {
      videoController!.pause();
    } else {
      videoController!.play();
    }
  }
}
