import 'package:cf_tube/component/custom_youtube_player.dart';
import 'package:cf_tube/model/video_model.dart';
import 'package:cf_tube/repository/youtube_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle:true,
        title: Text(
          '코팩튜브',
        ),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<List<VideoModel>>(
        future: YoutubeRepository.getVideos(),
        builder: (context,snapshot){
          if(snapshot.hasError){
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            physics: BouncingScrollPhysics(),
            children: snapshot.data!
            .map((e)=>CustomYoutubePlayer(videoModel: e)).toList(),
          );
        },
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}