import 'dart:io';

//게터세터
//게터: 값을 가져올때
//세터: 값을 지정할때
//사용시 모두 변수처럼 사용한다. 즉 사용할때 메서드명뒤에 ()를 붙이지 않음.

//세터는 거의 사용하지 않지만 게터는 종종 사용함
class Idol {
  // '_'로 변수명을 시작하면
  // 프라이빗 변수를 선언할수 있음
  String _name = '블랙핑크';

  //get 키워드를 사용해서 게터임을 명시
  //게터는 메서드와 다르게 매개변수를 전혀 받지 않는다.
  String get name {
    return this._name;
  }

//세터는 set이라는 키워드를 사용해서 선언
//세터는 매개변수로 딱하나의 변수를 받을수 있음
  set name(String name){
    this._name=name;
  }
}

void main() {
  Idol blackPink = Idol();
  blackPink.name='에이핑크';
  print(blackPink.name);
}
