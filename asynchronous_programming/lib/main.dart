//async와 await

// 비동기 프로그래밍을 유지하면서도 코드 가독성을 유지할수 있음.
//비동기 프로그래밍 특징을 유지하면서 코드가 작성된 순서대로 프로그램을 실해ㅇ힘

//async 키워드는 함수 매개변수 정의와 바디사이에 입력함
Future<void> addNumbers(int number1,int number2) async{
  print('$number1+$number2 계산 시작!');

  //await는 대기하고 싶은 비동기 함수 앞에 입력
  await Future.delayed(Duration(seconds: 3),(){
    print('$number1+$number2= ${number1+number2}');
  });

  print('$number1+$number2 코드실행끝!');
}

void main() async{

  await addNumbers(1,1); //addNumbers 함수가 순차적으로 실행되길 원할때
  await addNumbers(2,2);



}

