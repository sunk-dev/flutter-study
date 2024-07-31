import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/*
디자인 관련 위젯
배경을 추가하거나 간격을 추가하거나등 디자인적 요소를 적용할때 사용
Container 위젯
- 말 그대로 다른 위젯을 담는데 사용, 위젯의 너비와 높이를 지정하거나, 배경이나 테투리를 추가할때 많이 사용
SizedBox
- 일반적으로 일정크기의 공간을 공백으로 두고 싶을때 사용됨.
- const 생성자를 사용했을때 퍼포먼스에서 이점을 얻을 수 있음
Padding 위젯
- child 위젯에 여백을 제공할때 사용
- 크기 내부에 간격이 추가됨
- EdgeInsets 라는 매개 변수 입력

- margin -> 위젯바깥에 간격을 추가
EdgeInsets 다양항 생성자
- EdgeInsets.all(): 상하 좌우 매개변수에 입력된 패딩을 균등 적용
- EdgeInsets.symmetric(horizontal:16.0,vertical:16.0) : 가로와 세로 패딩을 따로 적용
- EdgeInsets.only(): 상하좌우 패딩 따로 적용
- EdgeInsets.fromLTRB(): 좌 ,위,우,아래 순서로 패딩 입력

SafeArea
- 기기별 예외처리 없이 안전한 화면에서 위젯그릴수 있음.
 */



void main() {
  runApp(FloatingActionButtonExample());
}

class FloatingActionButtonExample extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          //원하는 부위만 따로 적용가능
          // true: 적용 false :미적용
          top: true,
          bottom: true,
          left: true,
          right: true,
          child: Container(
            color: Colors.deepPurple,
            height: 300.0,
            width: 300.0,
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

