class StickerModel {
  final String id;
  final String imgPath;

  StickerModel({
    required this.id,
    required this.imgPath,

  });

  @override
  bool operator ==(Object other) {
    // ID 값이 같은 인스턴스 끼리를 같은 스티커로 인식
    return (other as StickerModel).id == id;
  }

  //Set에 중복 여부를 결정하는 속성
//Id 값이 같으면 Set 안에서 같은 인스턴스로 인식
  @override
  int get hasCode=>id.hashCode;
}