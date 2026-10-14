import 'package:google_mobile_ads/google_mobile_ads.dart';

/// AdMob ads ka central manager.
///
/// TODO (zaroori): AdMob account approve hone ke baad neeche wali TEST IDs
/// ko apni ASLI IDs se badal dein. Jab tak test IDs hain, sirf test ads
/// aayenge aur koi kamai nahi hogi.
class AdService {
  // Google ki official TEST IDs — development/testing ke liye.
  static const String bannerAdUnitId =
      'ca-app-pub-3940256099942544/6300978111';
  static const String interstitialAdUnitId =
      'ca-app-pub-3940256099942544/1033173712';

  static InterstitialAd? _interstitialAd;
  static int _sectionOpenCount = 0;

  static void loadInterstitial() {
    InterstitialAd.load(
      adUnitId: interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) => _interstitialAd = ad,
        onAdFailedToLoad: (error) => _interstitialAd = null,
      ),
    );
  }

  /// Har teesri section open par interstitial ad dikhata hai.
  static void maybeShowInterstitial() {
    _sectionOpenCount++;
    if (_sectionOpenCount % 3 == 0 && _interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          loadInterstitial();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          loadInterstitial();
        },
      );
      _interstitialAd!.show();
      _interstitialAd = null;
    } else if (_interstitialAd == null) {
      loadInterstitial();
    }
  }
}
