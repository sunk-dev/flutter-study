import 'dart:io';

void main()
{
  //익명함수와 람다함수
  // 둘ㄷ 함수 이름이 없고 일회성으로 사용됨.
  // 익명함수
  // (매개변수){함수바디}
  // 람다함수
  // (매개변수)=>{함수바디}
   List<int> numbers=[1,2,3,4,5];

   //일반함수로 모든값 더하기
  final allNumbers=numbers.reduce((v,e){return v+e; });
  print(allNumbers);

  //람다함수로 모든값 더하기
  final allNumberswithlamda=numbers.reduce((v,e)=>v+e);
  print(allNumberswithlamda);



}
