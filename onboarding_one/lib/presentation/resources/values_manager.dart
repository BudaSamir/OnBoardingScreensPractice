import 'package:flutter/cupertino.dart';

class AppMargin {
  static const double m5 = 5.0;
}

class AppPadding {
  static const double p8 = 8.0;
  static const double p40 = 40.0;
}

class AppSize {
  static const double s0 = 0.0;
  static const int s1 = 1;
  static const int s3 = 3;
  static const double s10 = 10.0;
  static const double s13 = 13.0;
  static const double s15 = 15.0;
  static const double s17 = 17.0;
  static const double s20 = 20.0;
  static const double s25 = 25.0;
  static const double s30 = 30.0;
  static const double s35 = 35.0;
  static const double s50 = 50.0;
  static const double s60 = 60.0;
  static const double s100 = 100.0;
  static const int s200 = 200;
  static const int s550 = 550;
  static const int s840 = 840;
}

class AppSizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenW;
  static double? screenH;
  static double? blockH;
  static double? blockV;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenW = _mediaQueryData!.size.width;
    screenH = _mediaQueryData!.size.height;
    blockH = screenW! / 100;
    blockV = screenH! / 100;
  }
}
