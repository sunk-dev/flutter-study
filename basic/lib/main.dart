import 'dart:io';

//인터페이스
//공통으로 필요한 기능을 정의만 해두는 역할
//인터페이스를 지정하는 키워드는 따로 없으며
//상속은 단하나의 클래스만 할수 있지만 인터페이스는 적용개수에 제한이 없음.

class Idol {
  final String name;
  final int membersCount;

  Idol(this.name, this.membersCount);

  void sayName() {
    print('저는 ${this.name}입니다');
  }

  void sayMembersCount() {
    print('${this.name} 멤버는 ${this.membersCount} 명 입니다.');
  }
}

// implements 키워드를 사용하면 원하는 클래스를 인터페이스로 사용가능
class GirlGroup implements Idol {
  final String name;
  final int membersCount;

  GirlGroup(this.name, this.membersCount);
  //인터페이스는 반드시 모든 기능을 다시 정의해 줘야함!
  void sayName() {
    print('저는 여자아이돌 ${this.name}입니다');
  }

  void sayMembersCount() {
    print('${this.name}멤버는 ${this.membersCount} 명 입니다!');
  }
}

void main() {
  GirlGroup blackPink = GirlGroup('블랙핑크', 4);
  blackPink.sayName();
  blackPink.sayMembersCount();
}
