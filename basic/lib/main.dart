void main(){

  // 컬렉션
  //여러값을 하나의 변수에 저장할수 있는 타입
  //서로의 타입으로 자유롭게 형변환이 가능하다는 장점

 // Set타입
 //  중복 없는 값들의 집합
  // Set<타입>세트이름

  Set<String> blackPink={'로제','지수','지수','제니','제니'};
  print(blackPink);
  print(blackPink.contains('로제'));//값이 있는지 확인 bool값 반환
  print(blackPink.toList()); //Set-> List변환

  List<String> blackPink2=['로제','지수','제니'];
  print(Set.from(blackPink2)); // List-> Set 변환

}