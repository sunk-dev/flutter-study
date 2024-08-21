import 'package:calendar_schedular/component/custom_text_field.dart';
import 'package:calendar_schedular/const/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:drift/drift.dart' hide Column;
import 'package:get_it/get_it.dart';
import 'package:calendar_schedular/database/drift_database.dart';

class SchduleBottomSheet extends StatefulWidget {
  final DateTime selectedDate; //선택된 날짜 상위 위젯에서 입력받기
  const SchduleBottomSheet({required this.selectedDate, Key? key})
      : super(key: key);

  @override
  State<SchduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<SchduleBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();
  int? startTime; //시작시간 저장변수
  int? endTime; //끝 시간 저장 변수
  String? content; // 일정 내용 저장 변수
  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return Form(
      key: formKey,
      child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height / 2 + bottomInset,
          color: Colors.white,
          child: Padding(
            padding:
                EdgeInsets.only(left: 8, right: 8, top: 8, bottom: bottomInset),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        label: '시작 시간',
                        isTime: true,
                        onSaved: (String? val) {
                          startTime = int.parse(val!);
                        },
                        validator: timeValidator,
                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: CustomTextField(
                        label: '종료 시간',
                        isTime: true,
                        onSaved: (String? val) {
                          endTime = int.parse(val!);
                        },
                        validator: timeValidator,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                Expanded(
                  child: CustomTextField(
                    label: '내용',
                    isTime: false,
                    onSaved: (String? val) {
                      content = val;
                    },
                    validator: contentValidator,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onSavePressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PRIMARY_COLOR,
                    ),
                    child: Text('저장'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

  void onSavePressed() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      await GetIt.I<LocalDataBase>().createSchedule(
        SchedulesCompanion(
          startTime: Value(startTime!),
          endTime: Value(endTime!),
          content: Value(content!),
          date: Value(widget.selectedDate),
        ),
      );
      Navigator.of(context).pop();
    }
  }

  String? timeValidator(String? val) {
    if (val == null) {
      return '값을 입력해 주세요';
    }
    int? number;
    try {
      number = int.parse(val);
    } catch (e) {
      return '숫자를 입력해 주세요';
    }
    if (number < 0 || number > 24) {
      return '0시 부터 24시 사이를 입력해주세요';
    }
    return null;
  }

  String? contentValidator(String? val) {
    if (val == null || val.length == 0) {
      return '값을 입력해주세요';
    }
    return null;
  }
}
