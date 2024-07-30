import 'dart:io';

//제네릭 generic
//특정변수의 타이ㅂ을 하나의 타입으로 제한하고 싶지 않을때 자주 사용함.
//<> 사이에 입력되는 값이 제네릭 문자

//인스턴스화 할때 입력받을 타입을 T로 지정함.
class Cache<T> {
  //data의 타입을 추후 입력될 T타입으로 지정함.
  final T data;

  Cache({required this.data});

}

void main() {
  //T의 타입을 List<int>로 입력
  final cache=Cache<List<int>>(data: [1,2,3]);

  //제네릭에 입력된 값을 통해 data 변수의 타입이 자동으로 유추됨
  print(cache.data.reduce((v,e)=>v+e));
}
