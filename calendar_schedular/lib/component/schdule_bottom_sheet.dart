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
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height/2,
        color: Colors.white,
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}