void main(){
  //var를 사용한 변수 선언
  //변수명은 중복 불가능
  var name='코드팩토리';
  print(name);

  //변수값 변경가능
  name='퍼플래빗';
  print(name);

  //dynamic를 사용한 변수 선언
  //var 타입은 변수의 값을 사용해서 한번 변수의 타입을 유추하면 추론된 타입으로 고정됨
  //따라서 고정된 변수 타입과 다른 변수타입의 값을 저장하려고 하면 에러 발생

  //but dynamic 키워드 사용시 변수의 타입이 고정되지 않아서 다른 타입의 값 저장가능
  dynamic newname='코드팩토리';
  newname=1;
  
  //final,const 사용한 변수선언
  final String idolname='블랙핑크';
  // idolname='BTS'; => 에러 발생 final로 선언한 변수는 선언후 값 변경 불가
  
  const String idolname2='BTS';
  // idolname2='블랙핑크'; => 에러 발생, const로 선언한 변수는 선언후 값 변경 불가
  
  //final const 차이
  //final : 런타임 상수, 코드가 실행될때 값이 확정되면 사용
  //const : 빌드타임 상수, 코드를 실행하지 않은 상태에서 값이 확정될떄 사용


  //DateTime.now() => 함수가 실행되는 순간의 날짜를 제공함 즉, 런타임, 실행을 해봐야 값을 알수 있음.
  final DateTime now=DateTime.now();
  print(now);
  
  //하지만 const 변수를 사용시 빌드타임에 값을 알수 있기때문에 DateTime.now() 함수를 const에 선언하여 사용하면 에러가 발생함
  // const DateTime errornow= DateTime.now();
  // print(errornow);

  //1.3 변수 타입
  //String-문자열
  String strname='코드팩토리';

  //int -정수
  int isInt=10;

  //double -실수
  double isDouble=3.0;

  //bool -불리언
  bool isTrue=true;

  print(isInt);
  print(isDouble);
  print(isTrue);


}