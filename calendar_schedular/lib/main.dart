
import 'package:calendar_schedular/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:calendar_schedular/firebase_options.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async{
  //플러터 프레임 워크가 준비 될때까지 대기,
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize(); //광고기능 초기화

  //파이어 베이스 프로젝트 설정함수
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initializeDateFormatting(); //init 패키지 초기화

  runApp(
   MaterialApp(
     debugShowCheckedModeBanner: false,
     home: HomeScreen(),
   )
  );
}


