import 'package:calendar_schedular/model/schedule_model.dart';
import 'package:calendar_schedular/repository/schedule_repository.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class ScheduleProvider extends ChangeNotifier {
  final ScheduleRepository repository;

  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  Map<DateTime, List<ScheduleModel>> cache = {};

  ScheduleProvider({
    required this.repository,
  }) : super() {
    getSchedules(date: selectedDate);
  }

  void getSchedules({
    required DateTime date,
  }) async {
    final resp = await repository.getSchedules(date: date);

    cache.update(date, (val) => resp, ifAbsent: () => resp);
    notifyListeners();
  }

  void createSchedule({
    required ScheduleModel schedule,
  }) async {
    final targetDate = schedule.date;
    final uuid=Uuid();
    final tempId=uuid.v4();
    final newSchedule=schedule.copyWith(
      id: tempId,
    );

    //긍정적 응답 구간, 서버에서 응답을 받기전에 캐시를 먼저 업데이트
    cache.update(
    targetDate,
        (value)=>[
          ...value,
          newSchedule,
        ]..sort(
            (a,b)=>a.startTime.compareTo(
              b.startTime
            ),
        ),
      ifAbsent: ()=>[newSchedule],

    );
    notifyListeners();

    try{
      final savedSchedule = await repository.createSchedule(schedule: schedule);
      cache.update(
        targetDate,
          (value)=>value
          .map((e)=>e.id==tempId?e.copyWith(
            id: savedSchedule,
          )
          :e).toList(),
      );

    }catch(e){
      cache.update(
        targetDate,
          (value)=>value.where((e)=>e.id!=tempId).toList(),
      );

    }

    notifyListeners();
  }

  void deleteSchedule({
    required DateTime date,
    required String id,
  }) async {

    final targetSchedule=cache[date]!.firstWhere(
        (e)=>e.id==id,
    );//삭제할 일정 기억

    cache.update(
      date,
          (value) => value.where((e) => e.id != id).toList(),
      ifAbsent: () => [],
    );
    notifyListeners();

    try{
      await repository.deleteSchedule(id: id);

    }catch(e){
      cache.update(
        date,
          (value)=>[...value,targetSchedule]..sort(
              (a,b)=>a.startTime.compareTo(
                b.startTime
              ),
          ),
      );
    }
    notifyListeners();


  }
  void changeSelectedDate({
    required DateTime date,
}){
    selectedDate=date;
    notifyListeners();
  }
}
