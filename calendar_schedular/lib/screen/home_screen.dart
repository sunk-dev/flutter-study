import 'package:calendar_schedular/component/main_calendar.dart';
import 'package:calendar_schedular/component/schedule_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}):super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();





}
class _HomeScreenState extends State<HomeScreen>{
  DateTime selectedDate= DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MainCalendar(
              selectedDate: selectedDate,
              onDaySelected: onDayselected,
            ),
            ScheduleCard(startTime: 12, endTime: 14, content: '프로그래밍 공부'),
          ],
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

  void onDayselected(DateTime selectedDate,DateTime foucusedDate){
    setState(() {
      this.selectedDate=selectedDate;
    });
  }

}