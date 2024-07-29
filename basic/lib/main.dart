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


}