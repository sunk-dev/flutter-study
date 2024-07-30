
//동기 vs 비동기
// 동기: 순서대로 요청과 응답을 처리함
//비동기 : 순서대로 요청을 해도 결과는 각각 다른 순서로 반환됨
//       컴퓨터 자원을 낭비하지 않고 효율적으로 코드 실행 가능
//          ex) 게시판 글을 가져오는 작업-> 오래 걸리므로 동기 코드로 실행하면 전체적으로 지연됨 -> 비동기 사용

void main(){

  //Future : 미래에 받아올 값을 의미함
  //제네릭으로 어떤 미래의 값을 받아올지를 정할수 있음.
  Future<String> name;//미래에 받은 String값
  Future<int> number;//미래에 받은 String값
  Future<bool> isOpend;//미래에 받은 String값

  addNumbers(1,1);

}

void addNumbers(int number1,int number2){
  print('$number1 + $number2 계산 시작!');

  //Future.delayed()를 사용하면 일정시간 후에 콜백함수를 실행할수 있음.

  Future.delayed(Duration(seconds: 3),(){ //비동기 연산이기 때문에 3초간 대기해야 한다는 메시지 받으면 바로 다음코드를 실행
    print('$number1+$number2=${number1+number2}');
  });
  print('$number1+$number2 코드 실행끝!');
}