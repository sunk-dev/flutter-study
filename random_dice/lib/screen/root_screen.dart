import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_dice/screen/home_screen.dart';
import 'package:random_dice/screen/settings_screen.dart';
import 'package:shake/shake.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  //TickerProviderStateMixin 사용하기
  TabController? controller; //사용할  TabController 선언
  double threshold = 2.7;
  int number = 1; //주사위 숫자
  ShakeDetector? shakeDetector;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this); //컨트롤러 초기화

    // 컨트롤러 속성이 변경 될때마다 실행할 함수 등록
    controller!.addListener(tabListener);

    shakeDetector = ShakeDetector.autoStart(
      shakeSlopTimeMS: 100, //감지주기
      shakeThresholdGravity: threshold, //감지 민감도
      onPhoneShake: onPhoneShake, //감지후 실행 할 함수
    );
  }

  void onPhoneShake() {
    final rand = new Random();
    setState(() {
      number = rand.nextInt(5) + 1;
    });
  }

  tabListener() {
    //리스너로 사용할수 있는 함수
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller!.removeListener(tabListener); //리스너에 등록한 함수 취소
    shakeDetector!.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: TabBarView(
        //탭화면을 보여줄 위젯
        controller: controller, //컨트롤러 등록
        children: renderChildren(),
      ),
      //아 탭 네비게이션을 구현하는 매개변수
      bottomNavigationBar: renderBottomNavigation(),
    );
    throw UnimplementedError();
  }

  List<Widget> renderChildren() {
    return [
      //홈스크린 불러와서 입력
      HomeScreen(number: number),
      SettingsScreen(threshold: threshold, onTresholdChange: onTresholdChange),
    ];
  }

  void onTresholdChange(double val) {
    setState(() {
      threshold = val;
    });
  }

  BottomNavigationBar renderBottomNavigation() {
    //탭 네비게이션을 구현하는 위젯
    return BottomNavigationBar(
        //현재 화면에 랜더링되는 탭의 인덱스
        currentIndex: controller!.index,
        onTap: (int index) {
          setState(() {
            controller!.animateTo(index);
          });
        },
        items: [
          BottomNavigationBarItem(
            //하단 탭바의 각 버튼 구현
            icon: Icon(
              Icons.edgesensor_high_outlined,
            ),
            label: '주사위',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: '설정',
          )
        ]);
  }
}
