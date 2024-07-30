
// Future 는 반환값을 딱 한번 받아내는 비동기 프로그래밍에 사용
//Stream -> 지속적으로 값을 반환 받을때 사용
// Stream 은 한번 리슨하면 Stream에 주입되는 모든 값들을 지속적으로 받아옴.

// 3. 함수로 Stram 반환하기
// StreamController를 직접사용하지 않고 직접 Stream을 반환하는 함수 작성가능
// Stream을 반환하는 함수는 async* 로 설전하고 yield 키워드로 반환
import 'dart:async';

Stream<String> calculate(int number) async*{
  for(int i=0;i<5;i++){
    //StreamController의 add() 처럼 yield키워드 이용해서 값 반환
    yield 'i=$i';
    await Future.delayed(Duration(seconds: 1));
  }
}

void playStream(){

  //StreamController 와 마찬가지로 listen() 함수로 콜백함수 입력
  calculate(1).listen((val){
    print(val);
  });
}

void main() async{
  playStream();


}

