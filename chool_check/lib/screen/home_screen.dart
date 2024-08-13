import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  static final LatLng companyLatLng = LatLng(
    37.5233273,
    126.921252,
  );
  
  //회사위치 마커선언
  static final Marker marker=Marker(
      markerId: MarkerId('company'),
    position: companyLatLng,
  );
  static final Circle circle=Circle(
    circleId: CircleId('choolCheckCircle'),
    center: companyLatLng, //원의 중심이 되는 위치
    fillColor: Colors.blue.withOpacity(0.5),
    radius: 100,//원의 반지름(미터 단위)
    strokeColor: Colors.blue,
    strokeWidth: 1,//원의 테투리 두께
    
  );

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: renderAppBar(),
        body:FutureBuilder<String>(
          future: checkPermission(),
          builder: (context,snapshot){
            if(!snapshot.hasData&&
            snapshot.connectionState==ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if(snapshot.data=='위치 권한이 허가 되었습니다.'){
              return Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: companyLatLng,
                        zoom: 16,
                      ),
                      markers: Set.from([marker]),
                      circles: Set.from([circle]),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.timelapse_outlined,
                          color: Colors.blue,
                          size: 50.0,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('출근하기!'),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return Center(
              child: Text(
                snapshot.data.toString(),
              ),
            );
          },
        )
    );
    // TODO: implement build
    throw UnimplementedError();
  }

  AppBar renderAppBar() {
    //AppBar 구현하는 함수
    return AppBar(
      centerTitle: true,
      title: Text(
        '오늘도 출첵',
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w700,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
  Future<String> checkPermission()async{
    final isLocationEnabled=await Geolocator.isLocationServiceEnabled();
    //위치 서비스 활성화 여부확인
    if(!isLocationEnabled){//위치서비스 활성화 안됨
      return '위치서비스를 활성화 해주세요!';
    }
    LocationPermission checkedPermission=await Geolocator.checkPermission();
    //위치 권한 확인
    if(checkedPermission==LocationPermission.denied){
      //위치 권한이 거절된 상태이면
      //위치권한 요청하기
      checkedPermission=await Geolocator.requestPermission();
      if(checkedPermission==LocationPermission.denied){
        return '위치 권한을 허가해주세요';
      }
    }
    if(checkedPermission==LocationPermission.deniedForever){
      return '앱의 위치권한을 설정에서 허가해 주세요';
    }
    //위 모든 조건이 통과 되면 위치 권한 허가 완료
    return '위치 권한이 허가 되었습니다.';//이런건 나중에 틀리면 찾기 힘드니까 상수로 바꾸는게 좋을듯!
  }

}
