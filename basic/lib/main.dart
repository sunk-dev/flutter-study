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

  //add()한수
  // List에 값 추가할떄 사용
  blackPinkList.add('ick');//리스트 끝에 추가
  print(blackPinkList);

  //where 함수
  // List에 있는 값들을 순서대로 순회하면서 특정조건에 맞는 값만 필터링하는데 사용
  // 매개변수에 함수를 입력하고 입력된 함수는 기종 값을 하나씩 매개 변수로 입력받아
  // true 반환시 값이 유지되고 false를 반환하면 값을 버림
  // 순회가 끝난후 유지된 값들을 기반으로 이터러블 반환

  final newList=blackPinkList.where(
      (name)=> name=='리사'|| name=='지수',); //리사 또는 지수 유지

  print(newList);
  print(newList.toList());

  // map 함수
  // 리스트에 있는 값들을 순서대로 순회하면서 값을 변경가능
  // 매개변수에 함수를 입력해야하며 입력된 함수는 기본값들을 매개변수로 받음
  // 이터러블로 반환

  final newMapList=blackPinkList.map(
      (name)=>'블랙핑크 $name',
  ) ;
  print(newMapList);

  //Iterable 을 다시 List로 변환하고 싶을때 .toList()사용
  print(newMapList.toList());

  //reduce함수
  // List에 있는 값들을 순회하면서 값을 쌓아감.
  // List의 멤버타입과 같은 타입을 반환

  final allMembers=blackPinkList.reduce(
  (value,element)=>value+', '+element,
  );
  //1. value:리사 element:지수
  //2 value :리사,지수 element:제니
  //3. valur:리사,지수,제니 element :로제
  //4. value :리사,지수,제니, 로제 element:ick

  print(allMembers);

  //fold 함수
  // reduce함수와 실행되는 논리는 같지만 fold함수는 어떤 타입이든 반환가능하다.
  final allMemberCount=blackPinkList.fold<int>(0,(value,element)=>value+element.length);
  print(allMemberCount);
}