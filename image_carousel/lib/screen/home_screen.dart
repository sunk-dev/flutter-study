
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}):super(key: key);
  State<StatefulWidget> createState()=> _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen>{
  //PageController 생성
  final PageController pageController=PageController();
  @override
  void initState(){
    super.initState();
    Timer.periodic(
      Duration(seconds: 3),
      (timer){
        int? nextPage=pageController.page?.toInt();
        if(nextPage==null){
          return;
        }
        if(nextPage==4){
          nextPage=0;
        }else{
          nextPage++;
        }
        pageController.animateToPage(nextPage,
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
        );
        },
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    //상태바 색상변경
    //상태바가 이미 흰색이면 light 재신 dark를 주어 검은 색으로 바꾸기
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      body: PageView(//페이지 뷰 추가
        controller: pageController,
        children: [1,2,3,4,5]// 샘플리스트 생성
            .map(//위젯으로 매핑
              (number)=> Image.asset('asset/img/image_$number.jpeg',
            fit: BoxFit.cover,),
        ).toList(),
      ),
    );
    throw UnimplementedError();
  }

}