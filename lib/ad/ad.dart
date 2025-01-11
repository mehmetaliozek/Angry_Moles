import 'package:angry_moles/classes/constant_values.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({super.key});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  late BannerAd staticAd;
  bool staticAdLoaded = false;

  void loadStaticBannerAd() {
    staticAd = BannerAd(
      adUnitId: ConstantValues.bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            staticAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();

          
        },
      ),
    );

    staticAd.load();
  }

  @override
  void initState() {
    super.initState();
    loadStaticBannerAd();
  }

  @override
  Widget build(BuildContext context) {
    if (staticAdLoaded) {
      return SizedBox(
        width: staticAd.size.width.toDouble(),
        height: staticAd.size.height.toDouble(),
        child: AdWidget(ad: staticAd),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
