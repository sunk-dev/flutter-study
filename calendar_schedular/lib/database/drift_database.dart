import 'package:calendar_schedular/model/schedule.dart';
import 'package:drift/drift.dart';

import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'drift_database.g.dart';

@DriftDatabase(
  tables:[
    Schedules,
  ]
)

class LocalDataBase extends _$LocalDataBase{
  LocalDataBase():super(_openConnection());

  Stream<List<Schedule>> wathSchedules (DateTime date)=>
      (select(schedules)..where((tbl)=>tbl.date.equals(date))).watch();
  Future<int> createSchedule(SchedulesCompanion data)=>
      into(schedules).insert(data);
  Future<int> removeSchedule(int id)=>
      (delete(schedules)..where((tbl)=>tbl.id.equals(id))).go();

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => 1;
}

LazyDatabase _openConnection(){
  return LazyDatabase(() async{
    final dbFolder= await getApplicationDocumentsDirectory();
    final file=File(p.join(dbFolder.path,'db.sqlite'));
    return NativeDatabase(file);

  });
}