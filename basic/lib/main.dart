void main(){
  // 연산자
  // 1. 기본 수치 연산자
  double number=2;
  print(number+2);
  print(number-2);
  print(number*2);
  print(number/2);
  print(number%3);
  //단항 연산자
  number++;
  number--;
  number+=2;
  number-=2;
  number*=2;
  number/=2;

  //null 관련연산자
  // null:아무겂도 없음
  // 타입뒤에 ?를 추가해야 null값이 저장될수 있음.

  double? number1=1;
  number1=null;
  print(number1);

  //null를 가잘수 있는 변수에 새로운 값을 추가할때 ??을추가시,
  // 기존에 null인 때에만 새로운 값이 저장되도록할수 있음

  double? number2=null;
  number2 ??=3;
  print(number2);

  number2 ??=4; //이전값이 null이 아니라 3이 유지됨.
  print(number2);

  //3 값 비교 연산자
  int number3=1;
  int number4=2;
  print(number3>number4);
  print(number3<number4);
  print(number3>=number4);
  print(number3<=number4);
  print(number3==number4);
  print(number3!=number4);

  //4. 타입 비교 연삱자
  print(number3 is int);
  print(number3 is String);
  print(number3 is! int);
  print(number3 is! int);
  
  //5. 논리 연산자
  //&& -> and
  //|| -> or
  bool result1 =12>10&& 1>0; // 12가 10보다 크고 1이 0보다 클때
  bool result2=12>10|| 1<0; // 12가 10보다 크고 1이 0보다 클때
  print(result1);
  print(result2);

}
