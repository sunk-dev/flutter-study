
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatelessWidget{
  const RootScreen ({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: TabBarView( //탭화면을 보여줄 위젯
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