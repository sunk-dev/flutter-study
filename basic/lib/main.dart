import 'dart:io';

//믹스인
// 특정클래스에 원하는 기능들만 골라 넣을 수 있는 기능
// 특정클래스를 지정해서 속성들을 정의 할수 있으며 지정한 클래스에서도 사용할수 있음
//인터페이스처럼 한개의 클래스에 여러개의 믹스인 적용가능

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

mixin IdolSingleMixin on Idol{
   void sing(){
     print('${this.name}이 노래를 부릅니다.');
   }
}

//믹스인을 적용할때는 with 키워드 사용
class BoyGroup extends Idol with IdolSingleMixin{
   BoyGroup(super.name,super.membersCount);

   void sayMale(){
     print('저는 남자 아이돌 입니다');
   }
}


void main() {

   BoyGroup bts=BoyGroup('BTS', 7);
   //믹스인에 정의된 sing()함수 사용가능
  bts.sing();

}
