import 'package:calendar_schedular/model/schedule.dart';
import 'package:drift/drift.dart';

part 'drift_database.g.dart';

@DriftDatabase(
  tables:[
    Schedules,
  ]
)

class LocalDataBase extends _$LocalDataBase{}