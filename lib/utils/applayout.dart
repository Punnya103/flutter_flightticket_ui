import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AppLayout {
  static Size getSize(BuildContext context) => MediaQuery.of(context).size;

  static double getScreenHeight() => Get.height;
  static double getScreenWidth() => Get.width;

  static double getHeight(double inputHeight) {
    return (inputHeight / 812.0) * getScreenHeight();
  }

  static double getWidth(double inputWidth) {
    return (inputWidth / 375.0) * getScreenWidth();
  }

  static double getResponsiveWidth(BuildContext context) {
    final width = getSize(context).width;
    if (width >= 1440) return width * 0.2;
    if (width >= 1024) return width * 0.3;
    if (width >= 600) return width * 0.5;
    return width * 0.8;
  }

  static double getResponsiveHeight(BuildContext context) {
    final height = getSize(context).height;
    if (height >= 1000) return 280;
    if (height >= 800) return 250;
    if (height >= 600) return 500;
    return 200;
  }
}
