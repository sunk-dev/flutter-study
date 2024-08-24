
import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdWidget extends StatefulWidget{
  const BannerAdWidget ({Key? key}):super(key: key);
  @override
  State<BannerAdWidget> createState() =>_BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget>{
  late final BannerAd banner;

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    final adUnitId='ca-app-pub-3940256099942544/6300978111';
    banner=BannerAd(
        size: AdSize.banner,
        adUnitId: adUnitId,
        listener: BannerAdListener(onAdFailedToLoad: (ad,error){
          ad.dispose();
        }),
        request: AdRequest());
    banner.load();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    banner.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: AdWidget(ad: banner,),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}