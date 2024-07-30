import 'dart:io';

// 캐스케이드 연산자
// 해당 인스턴스의 속성이나 멤버함수를 연속해서 사용하는 기능
class Idol {
  final String name;
  final int membersCount;
  Idol(this.name,this.membersCount);

  void sayName(){
    print('저는 ${this.name}입니다');
  }
  void sayMembersCount(){
    print('${this.name} 멤버는 ${this.membersCount} 명 입니다.');
  }
}


void main() {
  //cascade operator(..)을 사용하면
  // 선언한 변수의 메서드를 연속으로 실행할수 있음

  Idol blackPink=Idol('블랙핑크', 4)
      ..sayName()
      ..sayMembersCount();
}
