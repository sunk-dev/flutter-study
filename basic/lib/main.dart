void main(){

  // 컬렉션
  //여러값을 하나의 변수에 저장할수 있는 타입
  //서로의 타입으로 자유롭게 형변환이 가능하다는 장점

  //List 여러값을 순서대로 한 변수에 저장할때 사용됨
  //원소-> 리스트의 구성단위
  //리스트명[인덱스]

  List <String> blackPinkList=['리사','지수','제니','로제'];
  print(blackPinkList);
  print(blackPinkList[0]); //첫원소 지정
  print(blackPinkList[3]);//마지막 원소 지정

  print(blackPinkList.length);//리스트 길이 반환

  blackPinkList[3]='코드팩토리';//인덱스값 변경
  print(blackPinkList);

}