import 'package:calendar_schedular/component/main_calendar.dart';
import 'package:calendar_schedular/component/schedule_card.dart';
import 'package:calendar_schedular/component/today_banner.dart';
import 'package:calendar_schedular/component/schdule_bottom_sheet.dart';
import 'package:calendar_schedular/const/colors.dart';
import 'package:calendar_schedular/database/drift_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:calendar_schedular/database/drift_database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: PRIMARY_COLOR,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isDismissible: true,
            builder: (_) => SchduleBottomSheet(
              selectedDate: selectedDate,
            ),
            isScrollControlled: true,
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            MainCalendar(
              selectedDate: selectedDate,
              onDaySelected: onDayselected,
            ),
            SizedBox(
              height: 8.0,
            ),
            StreamBuilder<List<Schedule>>(
              stream: GetIt.I<LocalDataBase>().wathSchedules(selectedDate),
              builder: (context,snapshot){
                return TodayBanner(selectedDate: selectedDate, count: snapshot.data?.length??0);

              },
            ),

            SizedBox(
              height: 8.0,
            ),
            Expanded(
              child: StreamBuilder<List<Schedule>>(
                stream: GetIt.I<LocalDataBase>().wathSchedules(selectedDate),
                builder: (context,snapshot){
                  if(!snapshot.hasData){
                    return Container();
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context,index){
                      final schedule=snapshot.data![index];
                      return Dismissible(
                          key: ObjectKey(schedule.id),
                          direction: DismissDirection.startToEnd,
                          onDismissed: (DismissDirection direction){
                            GetIt.I<LocalDataBase>()
                                .removeSchedule(schedule.id);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0,left: 8.0,right: 8.0),
                            child: ScheduleCard(
                              startTime: schedule.startTime,
                              endTime: schedule.endTime,
                              content: schedule.content,
                            ),
                          ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

  void onDayselected(DateTime selectedDate, DateTime foucusedDate) {
    setState(() {
      this.selectedDate = selectedDate;
    });
  }
}
