import 'dart:io';
//생성자
//인스턴스를 생성하는 메서드
class Idol{
  //생성자에서 입력받는 변수들은 일반적으로 final 키워드 사용
  final String name;
  // 생성자 선언
  // 클래스와 같은 이름이어랴함
  // 함수의 매개변수를 선언하는 것처럼 매개변수를 지정해줌
  Idol(String name):this.name=name;
  void sayName(){
    print('저는 ${this.name}입니다');
  }
}

void main() {
  
  //인스턴스 생성
  Idol blackPink=Idol('블랙핑크');
  //메서드 실행
  blackPink.sayName();

  //name 에 BTS 저장
  Idol bts=Idol('BTS');
  bts.sayName();
  
  
}
