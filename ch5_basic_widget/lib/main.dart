import 'package:flutter/material.dart';

/*
위젯소개
  자식들을 하나만 갖는 위젯
  - 주로 child 매개변수를 입력받음
  - Container 위젯: 자식을 담는 컨테이너 역할, 단순하게 자식을 담는 역할이 아닌, 배경색, 너비와 높이 ,테두리 등의 디자인
  - GestureDetecor 위젯: 플러터에서 제공하는 제스터 기능을 자식위젯에서 인식하는 위젯, 탭 드래그 더블클릭같은 제스터 기능이 자식위젯에 인식됬을때 함수 실행
  - SizedBox 높이와 너비를 지정하는 위젯, Container 위젯과 다르게 디자인적 요소는 적용할수 없고, const 생성자로 선언할수 있어 퍼포먼스 측면에서 효율적
자식을 여러개갖는 위젯
  - childern 매개변수를 입력받음
  - 리스트로 여러 위젯을 입력받음
  - Column위젯: childern 매개변수에 입력된 모든 위젯들을 세로로 배치
  - Row 위젯: childern 매개변수에 입력된 모든 위젯들을 가로로 배치
  - ListView 위젯: 리스트 구현시사용 다수의 위젯 입력이 가능하녀, 입력된 위젯이 화면을 벗어나면 스크롤 가능
 */


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Center(
          // IconButton은 아이콘은 버튼으로 생성하는 위젯
          child:IconButton(
            //클릭시 실행
            onPressed: (){},
            icon: Icon(
              Icons.home,
            ),
          )
        ),
      ),
    );
  }
}

