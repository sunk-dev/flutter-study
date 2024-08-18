import 'package:cf_tube/component/custom_youtube_player.dart';
import 'package:cf_tube/model/video_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomYoutubePlayer(
        videoModel: VideoModel(
          id: '3Ck42C2ZCb8',
          title: '다트언어 기본기 1시간 만에 끝내기'
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}