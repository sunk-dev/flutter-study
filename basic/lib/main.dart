import 'dart:io';

// 상속
// 어떤 클래스의 기능을 다른 클래스가 사용할수 있게하는 기법
// 부모 클래스 -> 기능을 물려주는 클래스
// 자식 클래스-> 기능을 물려받는 클래스

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

void main() {
  BoyGroup bts=BoyGroup('BTS', 7);
  bts.sayName();
  bts.sayMembersCount();//부모한테 물려 받은 메서드
  bts.sayMale();// 자식이 새로 추가한 메서드
}
