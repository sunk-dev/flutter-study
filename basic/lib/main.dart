void main(){

  // 컬렉션
  //여러값을 하나의 변수에 저장할수 있는 타입
  //서로의 타입으로 자유롭게 형변환이 가능하다는 장점

  //enum
  // 한변수의 값을 몇가지 옵션으로 제한하는 기능
  // 선택지가 제한적일때 사용
  Status status=Status.approved;
  print(status);
}
enum Status{
  approved,
  pending,
  rejected,
}