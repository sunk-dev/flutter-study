import 'dart:io';


void main() {

  //try..catch
  try{
    //에러가 없을때 실행할 로직
    final String name='코드팩토리';
    print(name);
  }catch(e){
    //에러가 있을때 실행할로직
    print(e);

  }

  // throw 키워드-> 고의적으로 에러를 발생시킴
  try{
    final name2='코도도';
    throw Exception('이름이 잘못됬습니다!');
    print(name2);
  }catch(e){
    print(e);
  }

}
