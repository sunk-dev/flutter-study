import 'package:flutter/material.dart';

/*
디자인 관련 위젯
배경을 추가하거나 간격을 추가하거나등 디자인적 요소를 적용할때 사용
Container 위젯
- 말 그대로 다른 위젯을 담는데 사용, 위젯의 너비와 높이를 지정하거나, 배경이나 테투리를 추가할때 많이 사용
SizedBox
- 일반적으로 일정크기의 공간을 공백으로 두고 싶을때 사용됨.
- const 생성자를 사용했을때 퍼포먼스에서 이점을 얻을 수 있음
 */



void main() {
  runApp(FloatingActionButtonExample());
}

class FloatingActionButtonExample extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          //높이 지정
          height: 200.0,
          //너비지정
          width: 200.0,
          //sizedBox는 색상이 없으므로 크기를 확인하는
          //용도로 Container 추가
          child: Container(
            color: Colors.deepPurple,
          ),
        ),

      ),
    );
  }

}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Center(
          // IconButton은 아이콘은 버튼으로 생성하는 위젯
          child:GestureDetector(
            //한번 탭했을때 실행할 함수
            onTap: (){
              //출력결과는 안드로인드 스튜디오늬 Run탭에서 확인 가능합니다.
              print('on tap');
            },
            //두번탭했을때 실행할 함수
            onDoubleTap: (){
              print('on double tap');
            },

            //길게 눌렀을때 실행할 함수
            onLongPress: (){
              print('on Long press');
            },
            //제스처를 적용할 위젯
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              width: 100.0,
              height: 100.0,
            ),
          )
        ),
      ),
    );
  }
}

