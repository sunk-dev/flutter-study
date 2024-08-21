import 'package:calendar_schedular/component/custom_text_field.dart';
import 'package:calendar_schedular/const/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SchduleBottomSheet extends StatefulWidget{
  const SchduleBottomSheet({Key? key}):super(key: key);
  @override
  State<SchduleBottomSheet> createState()=> _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<SchduleBottomSheet>{
  @override
  Widget build(BuildContext context) {
    final  bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height/2+bottomInset,
        color: Colors.white,
        child: Padding(
          padding:  EdgeInsets.only(left: 8,right: 8,top: 8,bottom: bottomInset),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: '시작 시간',
                      isTime: true,
                    ),
                  ),
                  const SizedBox(width: 16.0,),
                  Expanded(
                    child: CustomTextField(
                      label: '종료 시간',
                      isTime: true,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0,),
              Expanded(
                child: CustomTextField(
                  label: '내용',
                  isTime: false,
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
    );
    // TODO: implement build
    throw UnimplementedError();
  }
  void onSavePressed(){

  }

}