import 'dart:io';
//클래스
class Idol{
  //클래스에 종속되는 변수지정
  String name='블랙핑크';
  
  //클래스에 종속되는 함수=> 메서드

  void sayName(){
    //클래스 내부의 속성을 지칭하고 싶을때는 this 키워드 사용
    print('저는 ${this.name}입니다');
    //스코프 안에 같은 속성이름이 하나만 존재한다면 this 생략가능
    print('저는 $name 입니다');
  }
}

void main() {
  
  //인스턴스 생성
  Idol blackPink=Idol();
  //메서드 실행
  blackPink.sayName();
  
  
}
