import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/*
배치 관련 위젯
- 위젯을 가로 또는 세로로 배치하거나 겹칠때 상ㅅㅇ
 Row위젯
 - 위젯을 가로로 위젯을 배치하는데 사용
 - childern 매개변수 사용
 - Main Axis(주축): 가로, Cross Axis(반대축):세로

 Column 위젯
  - 위젯을 세로로 위젯을 배치하는데 사용
 - childern 매개변수 사용
 - Main Axis(주축): 세로, Cross Axis(반대축):가로

 Flexible 위젯
 - 얼마만큼 비율로 공간을 차지 할건지 지정가능

 Expanded 위젯
 - Flexible 위젯을 상속하는 위젯
 - 위젯이 남아있는 공간을 최대한으로 차지

 Stack 위젯
- 위젯을 겹치는 기능 제공
- 위젯을 올린 듯한 효과 제공


 */



void main() {
  runApp(StackWidgetExample());
}

class StackWidgetExample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(

          //반대축에서 이동할 공간을 제거하기 위해 높이를 최대한으로 설정
          width: double.infinity,
          child: Stack(
            children: [

              Container(
                height: 300.0,
                width: 300.0,
                color: Colors.red,
              ),
              Container(
                height: 250.0,
                width: 250.0,
                color: Colors.yellow,
              ),
              Container(
                height: 200.0,
                width: 200.0,
                color: Colors.blueAccent,
              ),
            ],
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }

}

