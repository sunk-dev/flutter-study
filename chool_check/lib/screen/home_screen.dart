import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  static final LatLng companyLatLng = LatLng(
    37.5233273,
    126.921252,
  );

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: renderAppBar(),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: companyLatLng,
                  zoom: 16,
                ),
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
        ));
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
}
