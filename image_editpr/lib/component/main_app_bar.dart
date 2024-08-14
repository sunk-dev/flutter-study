import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  final VoidCallback onPickImage; //이미지 선택 버튼을 눌렀을때 실행할 한수
  final VoidCallback onSaveImage; //이미지 저장 버튼을 눌렀을떄, 실행할 함수
  final VoidCallback onDeleteItem; //이미지 삭제 버튼을 눌렀을떄 실행할 함수

  const MainAppBar({
    required this.onPickImage,
    required this.onSaveImage,
    required this.onDeleteItem,
    Key? key,

}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            onPressed: onPickImage,
            icon: Icon(
              Icons.image_search_outlined,
              color: Colors.grey[700],
            ),
          ),
          IconButton(
            onPressed: onDeleteItem,
            icon: Icon(
              Icons.delete_forever_outlined,
              color: Colors.grey[700],
            ),
          ),
          IconButton(
              onPressed: onSaveImage,
              icon: Icon(
                Icons.save,
                color: Colors.grey[700],
              ),
          ),
        ],
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}
