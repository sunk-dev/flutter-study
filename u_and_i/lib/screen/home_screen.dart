
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}):super(key: key);
  @override
  State<HomeScreen> createState()=>_HomeScreenState();

}
class _HomeScreenState extends State<HomeScreen>{
  DateTime firstDay=DateTime.now();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DDay(
              onHeartPressed:onHeartPressed,
              firstDay:firstDay,
            ),
            _CoupleImage(),
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }

  void onHeartPressed(){
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context){
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              height: 300,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (DateTime date){
                  setState(() {
                    firstDay=date;
                  });
                },
              ),
            ),
          );
        },
      barrierDismissible: true,
    );
    setState(() {
      firstDay=firstDay.subtract(Duration(days: 1));
    });
  }
}

class _DDay extends StatelessWidget{

  final GestureTapCallback onHeartPressed;
  final DateTime firstDay;

  _DDay({
    required this.onHeartPressed,
    required this.firstDay,
});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final textTheme=Theme.of(context).textTheme;
    final now=DateTime.now();
    return Column(
      children: [
        const SizedBox(height: 16.0,),
        Text('U&I',
        style:textTheme.headlineLarge ,),
        const SizedBox(height: 16.0,),
        Text('우리 처음 만난 날',
        style: textTheme.bodyLarge,),
        Text('${firstDay.year}.${firstDay.month}.${firstDay.day}',
        style: textTheme.bodyMedium,),
        const SizedBox(height: 16.0,),
        IconButton(
          iconSize: 60.0,
            onPressed: onHeartPressed,
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),),
        const SizedBox(height: 16.0,),
        Text('D+${DateTime(now.year,now.month,now.day).difference(firstDay).inDays+1}',
        style: textTheme.headlineMedium,),
      ],
    );
    throw UnimplementedError();
  }

}

class _CoupleImage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child:Center(
        child: Image.asset(
          'asset/img/middle_image.png',
          height: MediaQuery.of(context).size.height/2,
        ),
      ) ,
    );
    throw UnimplementedError();
  }

}