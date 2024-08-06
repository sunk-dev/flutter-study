import 'package:flutter/material.dart';
import 'package:random_dice/screen/home_screen.dart';
import 'package:random_dice/const/colors.dart';
import 'package:random_dice/screen/root_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      scaffoldBackgroundColor: backgroungColor,
      sliderTheme: SliderThemeData( //Slider 위젯 관련 테마
        thumbColor: primaryColot, //노브 색상
        activeTrackColor: primaryColot, //노브가 이동한 트랙 색상
        //노브가 아직 이동하지 않응 트랙 색상
        inactiveTrackColor: primaryColot.withOpacity(0.3),
      ),
      //BottomNavigationBar 위젯 관련 테마
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: primaryColot,//선택 상태 색
        unselectedItemColor: secondaryColor,//비선택 상태 색
        backgroundColor: backgroungColor,//배경 색
      ),
    ),
    home: RootScreen(),
  ));
}
