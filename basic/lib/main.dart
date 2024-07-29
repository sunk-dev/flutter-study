void main(){

  // 컬렉션
  //여러값을 하나의 변수에 저장할수 있는 타입
  //서로의 타입으로 자유롭게 형변환이 가능하다는 장점

  //Map 타입
  // 키와 값의 짝을 저장함
  // 키를 이용해 원하는 값을 빠르게 찾는데 중점을 둠
  // Map<키의 타입,값으타입>맵이름
  Map<String,String> dictionary={
    'Harry Poter':'해리포터',
    'Ron Weasley':'론위즐리',
    'Hermione Granger':'헤르미온느 그레인저',
  };
  print(dictionary['HarryPoter']);
  print(dictionary['Hermione Granger']);

  //키값 반환하기
  //Iterable가 반환되기에 .toList()사용가능
  print(dictionary.keys);
  print(dictionary.values);

}