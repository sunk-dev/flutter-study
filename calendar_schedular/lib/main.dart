import 'package:calendar_schedular/database/drift_database.dart';
import 'package:calendar_schedular/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:calendar_schedular/database/drift_database.dart';
import 'package:get_it/get_it.dart';
import 'package:calendar_schedular/provider/schedule_provider.dart';
import 'package:calendar_schedular/repository/schedule_repository.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:calendar_schedular/firebase_options.dart';

void main() async{
  //플러터 프레임 워크가 준비 될때까지 대기,
  WidgetsFlutterBinding.ensureInitialized();

  //파이어 베이스 프로젝트 설정함수
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initializeDateFormatting(); //init 패키지 초기화
  final database=LocalDataBase();
  final repository=ScheduleRepository();
  final schdeuleProvider=ScheduleProvider(repository: repository);
  GetIt.I.registerSingleton<LocalDataBase>(database);
  runApp(
    ChangeNotifierProvider(
        create: (_)=>schdeuleProvider,
      child: MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}


