
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    //상태바 색상변경
    //상태바가 이미 흰색이면 light 재신 dark를 주어 검은 색으로 바꾸기
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      body: PageView(//페이지 뷰 추가
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