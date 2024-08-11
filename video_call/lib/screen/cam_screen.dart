import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:video_call/const/agora.dart';

class CamScreen extends StatefulWidget {
  const CamScreen({Key? key}) : super(key: key);

  @override
  _CamScreenState createState() => _CamScreenState();
}

class _CamScreenState extends State<CamScreen> {
  RtcEngine? engine; // 아고라 엔진을 저장할 변수
  int? uid; // 내 ID
  int? otherUid; // 상대방 ID

  Future<bool> init() async {
    final resp = await [Permission.camera, Permission.microphone].request();

    final cameraPermission = resp[Permission.camera];
    final micPermission = resp[Permission.microphone];

    if (cameraPermission != PermissionStatus.granted ||
        micPermission != PermissionStatus.granted) {
      throw '카메라 또는 마이크의 권한이 없습니다';
    }

    if (engine == null) {
      //엔진이 정의 되지 않았으면 새로 정의하기
      engine = createAgoraRtcEngine();
      await engine!.initialize(
        RtcEngineContext(
          //미리 저장해둔 APPID 입력
          appId: APP_ID,
          //라이브 동영산 송출레 최저화
          channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
        ),
      );
      engine!.registerEventHandler(
        //아고라 엔진에서 받을 수 있는 이벤트 값들 등록
        RtcEngineEventHandler(
          onJoinChannelSuccess: (RtcConnection connection, int elapes) {
            print('채널에 입장 성공했습니다 uid: ${connection.localUid}');
            setState(() {
              this.uid = connection.localUid;
            });
          },
          onLeaveChannel: (RtcConnection connection, RtcStats stats) {
            print('채널을 퇴장 했습니다');
            setState(() {
              uid = null;
            });
          },
          onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
            print('상대가 채널에 입장 했습니다 uid ${remoteUid}');
            setState(() {
              otherUid = remoteUid;
            });
          },
          onUserOffline: (RtcConnection connection, int remoteUid,
              UserOfflineReasonType reason) {
            print('상태가 채널에서 나갔습니다. uid ${uid}');
            setState(() {
              otherUid = null;
            });
          },
        ),
      );

      await engine!.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
      await engine!.enableVideo();
      await engine!.startPreview();
      //채널에 들어가기
      await engine!.joinChannel(
          token: TEMP_TOKEN,
          channelId: CHANNEL_NAME,
          //영상과 관련된 여러가지 설정을 할수 있습니다

          uid: 0,
          options: ChannelMediaOptions());
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LIVE'),
      ),
      body: FutureBuilder(
        future: init(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      renderMainView(),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          color: Colors.grey,
                          height: 160,
                          width: 120,
                          child: renderSubview(),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    onPressed: () async{
                      if(engine!=null){
                        await engine!.leaveChannel();
                      }
                      Navigator.of(context).pop();
                    },
                    child: Text('채널 나기기'),
                  ),
                )
              ],
            );
          }
          if (!snapshot.hasError) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Stack(
            children: [
              renderMainView(),//상대방이 찍는 화면
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  color: Colors.grey,
                  height: 160,
                  width: 120,
                  child: renderSubview(),
                ),
              )
            ],
          );
        },
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }


//내 핸드폰이 찍는 화면 렌더링
//   Widget renderSubView()
  Widget renderSubview() {
    if(uid!=null){
      //AgoraVideoWiew 위젯을 사용하면
      //동영상 화면에 보여주는 위젝을 구현할수 있습니다
      return AgoraVideoView(
        //VideoViewCOntroller 를 매개변수로 입력해주면
        //해당 컨트롤러가 제공하는 동영상정보를
        //AgoraView 위젯을 통해 보여줄 수 있습니다
        controller: VideoViewController(
          rtcEngine: engine!,
          canvas: const VideoCanvas(uid: 0),

        ),
      );
    }else{
      // 내가 아직 채널에 접속하지 않았다면 로딩화면을 보여줍니다
      return CircularProgressIndicator();
    }
  }
  Widget renderMainView(){
    if(otherUid!=null){
      return AgoraVideoView(
          controller:VideoViewController.remote(rtcEngine: engine!, canvas: VideoCanvas(uid: otherUid), connection:const RtcConnection(channelId: CHANNEL_NAME)));
    }else{
      return Center(
        child: const Text(
          '다른 사용자가 입장할떄까지 기다려주세요',
          textAlign: TextAlign.center,
        ),
      );
    }
  }
}
