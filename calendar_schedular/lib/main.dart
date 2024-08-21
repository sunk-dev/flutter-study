import 'package:calendar_schedular/database/drift_database.dart';
import 'package:calendar_schedular/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:calendar_schedular/database/drift_database.dart';
import 'package:get_it/get_it.dart';

void main() async{
  //플러터 프레임 워크가 준비 될때까지 대기,
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting(); //init 패키지 초기화
  final database=LocalDataBase();
  GetIt.I.registerSingleton<LocalDataBase>(database);
  runApp(
    MaterialApp(
      home: HomeScreen(),
    )
  );
}


