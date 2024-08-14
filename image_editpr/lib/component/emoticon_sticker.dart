import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmoticonSticker extends StatefulWidget {
  final VoidCallback onTransForm;
  final String imgPath;
  final bool isSelected;

  const EmoticonSticker({
    required this.onTransForm,
    required this.imgPath,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  @override
  State<EmoticonSticker> createState()=> _EmoticonStickerState();

}

class _EmoticonStickerState extends State<EmoticonSticker>{
  double scale=1;//확대 축소 배율
  double hTransForm=0; //가로의 움직임
  double vTransForm=0; //서로의 움직임
  double actualScale=1; //위젯 초기 크기 기준 확대 축소 배율


  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
      ..translate(hTransForm,vTransForm)
      ..scale(scale,scale),
      child: Container(
        decoration: widget.isSelected
            ? BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: Colors.blue,
            width: 1.0,
          ),
        ):BoxDecoration(
          border: Border.all(
            width: 1.0,
            color: Colors.transparent,
          ),
        ) ,
        child: GestureDetector(
          onTap: (){
            widget.onTransForm();
          },
          onScaleUpdate: (ScaleUpdateDetails details){
            widget.onTransForm();
            setState(() {
              scale=details.scale*actualScale;
              vTransForm+=details.focalPointDelta.dy;
              hTransForm+=details.focalPointDelta.dx;
            });
          },
          onScaleEnd: (ScaleEndDetails details){
            actualScale=scale;
          },
          child: Image.asset(
            widget.imgPath,
          ),
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}
