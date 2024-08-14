//스티커를 선택할때마다 실행할 함수의 시그니처
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef OnEmoticonTap = void Function(int id);

class Footer extends StatelessWidget {
  final OnEmoticonTap onEmoticonTap;

  const Footer({
    required this.onEmoticonTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white.withOpacity(0.9),
      height: 150,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,//가로로 스크롤 구현
        child: Row(
          children:
            List.generate(7,
                (index)=>Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: (){
                      onEmoticonTap(index+1);
                    },
                    child: Image.asset('asset/img/emoticon_${index+1}.png',
                    height: 100,
                    ),
                  ),
                ),
            ),
        ),
      ),

    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
