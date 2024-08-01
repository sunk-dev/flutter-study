import 'package:flutter/material.dart';

void main() {
  runApp(SplachScreen());
}

class SplachScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF99231),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset(
                  'assets/logo.png',
                  width: 200,
                ),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(
                    Colors.white,
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }
}
