
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget{
  const RootScreen ({Key? key}):super(key: key);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    _RootScreenState();
    throw UnimplementedError();
  }


}

class _RootScreenState extends State<RootScreen> with
TickerProviderStateMixin{ //TickerProviderStateMixin 사용하기
  TabController? controller; //사용할  TabController 선언

  @override
  void initState(){
    super.initState();
    controller=TabController(length: 2, vsync: this); //컨트롤러 초기화
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: TabBarView( //탭화면을 보여줄 위젯
        controller: controller, //컨트롤러 등록
        children: renderChildren(),
      ),
      //아 탭 네비게이션을 구현하는 매개변수
      bottomNavigationBar: renderBottomNavigation(),
    );
    throw UnimplementedError();
  }

  List<Widget> renderChildren(){
    return [];
  }

  BottomNavigationBar renderBottomNavigation(){
    //탭 네비게이션을 구현하는 위젯
    return BottomNavigationBar(items: []);
  }
}