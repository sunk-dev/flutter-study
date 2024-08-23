import 'package:flutter/material.dart';
import 'package:calendar_schedular/component/main_calendar.dart';
import 'package:calendar_schedular/component/schedule_card.dart';
import 'package:calendar_schedular/component/today_banner.dart';
import 'package:calendar_schedular/component/schdule_bottom_sheet.dart';
import 'package:calendar_schedular/const/colors.dart';
import 'package:get_it/get_it.dart';
import 'package:calendar_schedular/database/drift_database.dart';
import 'package:provider/provider.dart'; // ➊ Provider 불러오기
import 'package:calendar_schedular/provider/schedule_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/schedule_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.utc(
    // ➋ 선택된 날짜를 관리할 변수
    DateTime
        .now()
        .year,
    DateTime
        .now()
        .month,
    DateTime
        .now()
        .day,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        // ➊ 새 일정 버튼
        backgroundColor: PRIMARY_COLOR,
        onPressed: () {
          showModalBottomSheet(
            // ➋ BottomSheet 열기
            context: context,
            isDismissible: true, // ➌ 배경 탭했을 때 BottomSheet 닫기
            isScrollControlled: true,
            builder: (_) =>
                ScheduleBottomSheet(
                  selectedDate: selectedDate, // 선택된 날짜 (selectedDate) 넘겨주기
                ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: SafeArea(
        // 시스템 UI 피해서 UI 구현하기
        child: Column(
          // 달력과 리스트를 세로로 배치
          children: [
            MainCalendar(
              selectedDate: selectedDate, // 선택된 날짜 전달하기

              // 날짜가 선택됐을 때 실행할 함수
              onDaySelected: (selectedDate, focusedDate) =>
                  onDaySelected(selectedDate, focusedDate, context),
            ),
            SizedBox(height: 8.0),
            TodayBanner(
              // ➊ 배너 추가하기
              selectedDate: selectedDate,
              count: 0,
            ),
            SizedBox(height: 8.0),
            Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection(
                    'schedule',
                  ).where(
                    'date',
                    isEqualTo:
                    '${selectedDate.year}${selectedDate.month}${selectedDate.day}',
                  )
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('일정 정보를 받아오는 데 실패했습니다'),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container();
                    }

                    final schedules = snapshot.data!.docs
                        .map((QueryDocumentSnapshot e) =>
                        ScheduleModel.fromJson(
                            json: (e.data() as Map<String, dynamic>)),
                    ).toList();
                    return ListView.builder(
                        itemCount: schedules.length,
                        itemBuilder: (context, index) {
                          final schedule = schedules[index];
                          return Dismissible(
                            key: ObjectKey(schedule.id),
                            direction: DismissDirection.startToEnd,
                            onDismissed: (DismissDirection direction){

                            },
                            child: Padding(
                              padding:  const EdgeInsets.only(
                                bottom: 8.0,left: 8.0,right: 8.0
                              ),
                              child: ScheduleCard(
                                startTime: schedule.startTime,
                                endTime: schedule.endTime,
                                content: schedule.content,
                              ),
                            ),
                          );
                        }
                    );
                  },
                )

            ),
          ],
        ),
      ),
    );
  }

  void onDaySelected(DateTime selectedDate,
      DateTime focusedDate,
      BuildContext context,) {
    setState(() {
      this.selectedDate = selectedDate;
    });
  }

}