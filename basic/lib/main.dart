import 'dart:io';

//추상
//상속이나 인터페이스로 사용하는데 칠요한 속성만 정의하고 인스턴스화 할수도 없도록하는 기능
//추상 클래스는 추상메서드를 선언할수 있으며 추상메서드는 함수의 반환타입, 이름 매개변수만을 정의하고
//함수의 바디의 선언을 자식클래스에서 필수로 정의하도록 강제함.

abstract class Idol {
  final String name;
  final int membersCount;

  Idol(this.name, this.membersCount);

  void sayName() ;

  void sayMembersCount() ;
}

class GirlGroup implements Idol{
  final String name;
  final int membersCount;

  GirlGroup(this.name,this.membersCount);


  @override
  void sayMembersCount() {
    // TODO: implement sayMembersCount
    print('${this.name}의 멤버는 ${this.membersCount}명 입니다');
  }

  @override
  void sayName() {
    // TODO: implement sayName
    print('저는 여자아이돌 ${this.name}입니다');
  }

}


void main() {

  GirlGroup blackPink=GirlGroup('블랙핑크', 4);
  blackPink.sayName();
  blackPink.sayMembersCount();

}
