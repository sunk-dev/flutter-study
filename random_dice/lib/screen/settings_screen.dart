import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_dice/const/colors.dart';

class SettingsScreen extends StatelessWidget {
  final double threshold; //Slider의 현재값

  final ValueChanged<double> onTresholdChange;

  const SettingsScreen({
    Key? key,

    //
    required this.threshold,
    required this.onTresholdChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                Text(
                  '민감도',
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize:  20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
        ),
        Slider(
          min: 0.1, //최솟값
          max: 10.0,
          divisions: 101, // 최솟값과 최댓값사이 구각 개수
          value: threshold,//슬라이더 선택값
          onChanged: onTresholdChange,//값변경시 실행되는 함수
          label: threshold.toStringAsFixed(1),//표싯값
        ),
      ],
    );
    throw UnimplementedError();
  }
}
