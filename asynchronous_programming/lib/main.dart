
// Future 는 반환값을 딱 한번 받아내는 비동기 프로그래밍에 사용
//Stream -> 지속적으로 값을 반환 받을때 사용
// Stream 은 한번 리슨하면 Stream에 주입되는 모든 값들을 지속적으로 받아옴.

// 2. 브로드캐스트 스트림
// stream은 단한번만 listen을 항수 있음
//브로드 캐스드 스트림을 사용하면 Stream을 여러번 listen하도록 반환
import 'dart:async';

void main() async{
  final controller=StreamController();// StreamController 선언

  //여러번 리슨 할수 있는 Broadcast Stream 객체 생성
  final stream=controller.stream.asBroadcastStream();//

  //첫 listen()함수
  final streamListener1=stream.listen((val){
    print('listen1');
    print(val);
  });

  //두번째 listen()함수
  final streamListener2=stream.listen((val){
    print('listen2');
    print(val);
  });


  //add() 실행할때마다 listen()하는 모든 콜백함수에 값이 주입됨.
  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);


}

