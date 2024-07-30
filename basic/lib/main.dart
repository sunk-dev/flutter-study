import 'dart:io';
//프라이빗변수
//같은 파일에서만 접근 가능한 변수

class Idol {
  // '_'로 변수명을 시작하면
  // 프라이빗 변수를 선언할수 있음
  String _name;
  Idol(this._name);
}

void main() {
  Idol blackPink=Idol('블랙핑크');

  //같은 파일에서는  _name 변수에 접근할수 있지만
  // 다른 파일에서는 접근 불가
  print(blackPink._name);

}
