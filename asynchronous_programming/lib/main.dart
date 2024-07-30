
// Future 는 반환값을 딱 한번 받아내는 비동기 프로그래밍에 사용
//Stream -> 지속적으로 값을 반환 받을때 사용
// Stream 은 한번 리슨하면 Stream에 주입되는 모든 값들을 지속적으로 받아옴.

// 1. Stream 기본 사용법
// stream 이용시 dart:async 패키지 이용
import 'dart:async';

void main() async{
  final controller=StreamController();// StreamController 선언
  final stream=controller.stream;// Stream 가져오기

  //Stream listen() 함수를 실행하면 값이 주입될때마다 콜백함수를 실행가능
  final streamListener1= stream.listen((val){print(val);});


  //Stream에 값 주입
  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  controller.sink.add(4);


}

