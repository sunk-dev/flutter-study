
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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