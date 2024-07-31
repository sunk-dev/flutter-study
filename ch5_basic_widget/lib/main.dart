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

 */



void main() {
  runApp(FlexibleWidgetExample());
}

class FlexibleWidgetExample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(

          //반대축에서 이동할 공간을 제거하기 위해 높이를 최대한으로 설정
          width: double.infinity,
          child: Column(
            //주축 정렬지정
            mainAxisAlignment: MainAxisAlignment.center,
            //반대축정렬지정
            crossAxisAlignment: CrossAxisAlignment.center,

            //넣고싶은 위젯 입력
            children: [
              Flexible(
                //flex:남은 공간를 차지할 비용
                // flex를 제공하지 않을시 기본값 1
                flex: 1,
                child:  Container(
                  color: Colors.red,
                ),
              ),
              Flexible(
                //flex:남은 공간를 차지할 비용
                // flex를 제공하지 않을시 기본값 1
                flex: 3,
                child:  Container(
                  color: Colors.blueAccent,
                ),
              ),



            ],
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }

}

