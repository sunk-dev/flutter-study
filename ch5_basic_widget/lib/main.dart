import 'package:flutter/material.dart';

/*
디자인 관련 위젯
배경을 추가하거나 간격을 추가하거나등 디자인적 요소를 적용할때 사용
Container 위젯
- 말 그대로 다른 위젯을 담는데 사용, 위젯의 너비와 높이를 지정하거나, 배경이나 테투리를 추가할때 많이 사용
 */



void main() {
  runApp(FloatingActionButtonExample());
}

class FloatingActionButtonExample extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Container(
          //스타일 작용
          decoration: BoxDecoration(
            //배경색 적용
            color: Colors.deepPurple,
            //테두리적용
            border: Border.all(
              //테두리 굵기
              width: 16.0,
              //테두리 색상
              color: Colors.black
            ),
            //모서리 둥굴게 만들기
            borderRadius: BorderRadius.circular(16.0,),

          ),
          //높이
          height: 200.0,
          //너비
          width: 100.0,
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

