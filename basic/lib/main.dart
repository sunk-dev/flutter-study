import 'dart:io';

//스테틱
//지금까지 작성한 변수, 메서드등은 모두 각 클래스의 인스턴스에 귀속되지만,
//static 키워드를 사용하면 클레스 자체에 귀속됨.

class Counter{
  // static 키워드를 사용해 변수선언
  static int i=0;

  Counter(){
    i++;
    print(i);
  }
}

void main() {
  Counter count1=Counter();
  Counter count2=Counter();
  Counter count3=Counter();
}
