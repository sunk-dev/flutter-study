int addTwoNumbers(int a, int b){ //위치 매개변수, int a가 intb 보다 먼저 선언됬기에 함수를 사용할때도 1,2 순서대로 a,b에 지정됨.
  return a+b;
}

int addTwoNumbersWithNamedParameter({
  required int a, //NamedParameter 사용 방법
  required int b,
}){return a+b;
}

//기본값을 갖는 포지셔널 파라미터 -> []기호를 사용
int addTwoNumbersWithDefaultParameter(int a, [int b=2]){
  return a+b;
}

int addTwoNumbersWithNamedandDefault({
  required int a,
  int b=2,
}){
  return a+b;
}

int addTwoNumbersWithNamedandPositional(
    int a,{
  required int b,
  int c=2,
}){
  return a+b+c;
}


void main(){
// 함수와 람다
//함수의 일반적 특징
//한번만 작성하고 여러곳에서 재활용할수 있음

print(addTwoNumbers(1,3));
print(addTwoNumbers(5,3));

// 매개변수를 지정하는 방법
//1. Positional Parameter: 순서가 고정된,
//2. Named Parameter: 이름이 있는 매개변수 required 키워드 사용

print(addTwoNumbersWithNamedParameter(a: 2, b: 2));

//기본값을 갖는 포지셔널 파라미터 -> []기호를 사용
print(addTwoNumbersWithDefaultParameter(8));

//  네임드 파라미터에 기본값 적용시
print(addTwoNumbersWithNamedandDefault(a: 7));

//포지션 파라미터와 네임드 파라터를 섞어쓸때는 포지션이 네임드 파라미터보다 앞에 와야함.
print(addTwoNumbersWithNamedandPositional(4, b: 8));




}
