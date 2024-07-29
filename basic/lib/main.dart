import 'dart:io';

typedef Operation = void Function(int x, int y);

void add(int x, int y) {
  print('결과값: ${x + y}');
}

void subtract(int x, int y) {
  print('결과값: ${x - y}');
}

void calculate(int x, int y,Operation oper) {
 oper(x,y);
}

void main() {
//typedef와 함수
//typedef는 함수의 시그니처(반환값 타입,매개변수 개수와 타입..)를 정의하는 값

//typedef는 일반적인 변수의 type처럼 사용가능
  Operation oper = add;
  oper(1, 2);

//subtract() 함수도 Operation에 해당되는
//시그니처 이므로 oper변수에 저장가능
  oper = subtract;
  oper(1, 2);

  // 다트에서 함수는 일급객체라 함수를 값처럼 사용가능
  calculate(1, 3, add);
}
