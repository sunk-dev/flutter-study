import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  XFile? video;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: video == null ? renderEmpty() : renderVideo(),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

  Widget renderEmpty() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Logo(),
          SizedBox(
            height: 30.0,
          ),
          _AppName(),
        ],
      ),
    );
  }

  Widget renderVideo() {
    return Container();
  }
}

class _Logo extends StatelessWidget {
  const _Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'asset/img/logo.png',
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _AppName extends StatelessWidget{
  const _AppName({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle=TextStyle(
      color: Colors.white,
      fontSize: 30.0,
      fontWeight: FontWeight.w300,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'VIDEO',
          style: textStyle,
        ),
        Text(
            'PLAYER',
          style: textStyle.copyWith(
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
    // TODO: implement build
    throw UnimplementedError();
  }


}
