//유튜브 재생기 사용하기 위해 패키지 불러오기
import 'package:cf_tube/model/video_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomYoutubePlayer extends StatefulWidget {
  //상위 위젯에서 입력받을 동영상 정보
  final VideoModel videoModel;

  const CustomYoutubePlayer({
    required this.videoModel,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomYoutubePlayer> createState() => _CustomYoutubePlayerState();
}

class _CustomYoutubePlayerState extends State<CustomYoutubePlayer> {
  YoutubePlayerController? controller;

  @override
  void initState() {
    super.initState();
    controller = YoutubePlayerController(
      initialVideoId: widget.videoModel.id,
      flags: YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        YoutubePlayer(
          controller: controller!,
          showVideoProgressIndicator: true,

        ),
        const SizedBox(height: 16.0,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            widget.videoModel.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 16.0,),
      ],
    );
    // TODO: implement build
    throw UnimplementedError();
  }
  @override
  void dispose(){
    super.dispose();
    controller!.dispose();//State 폐기시 컨트롤러 폐기
  }
}
