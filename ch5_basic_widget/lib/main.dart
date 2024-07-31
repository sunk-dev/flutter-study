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

 */



void main() {
  runApp(ColumnWidgetExample());
}

class ColumnWidgetExample extends StatelessWidget{
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
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.red,
              ),

              //Sized 박스는 일반적으로 공백을 생성할때 사용
              const SizedBox(width: 12.0,),
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.green,
              ),

              //Sized 박스는 일반적으로 공백을 생성할때 사용
              const SizedBox(width: 12.0,),
              Container(
                height: 50.0,
                width: 50.0,
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

