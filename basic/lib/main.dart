import 'dart:io';

//오버라이드
//부모 클래스또는 인터페이스에 정의된 메서드를 재정의 할때 사용됨


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

class BoyGroup extends Idol{
  //상속받은 생성자
  BoyGroup(String name,
      int membersCount,
      ):super(name,membersCount,); //super은 부모 클래스 지칭
  //상속받지 않은 기능

  void sayMale(){
    print('저는 남자 아이돌 입니다.');
  }
}

class GirlGroup extends Idol{
  GirlGroup(super.name,super.membersCount);

  @override //override 키워드를 사용!
  void sayName(){
    print('저는 여자아이돌 ${this.name}입니다');
  }
}

void main() {
  BoyGroup bts=BoyGroup('BTS', 7);
  bts.sayName();
  bts.sayMembersCount();//부모한테 물려 받은 메서드
  bts.sayMale();// 자식이 새로 추가한 메서드

  GirlGroup blackPink=GirlGroup('블랙핑크', 4);
  blackPink.sayName(); //자시클래스으 오버라이딩된 메서드

  //sayNameCount는 오버라이드 하지 않았기때문에
  // 그대로 Idol 클래스의 메서드가 실행됩니다.
  blackPink.sayMembersCount();
}

