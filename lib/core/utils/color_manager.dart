import 'package:flutter/material.dart';

class ConfigColor {
  static const Color kWhiteColor = Colors.white;
  static Color kgreyMigrateColor = Colors.grey.shade200;
  static Color kDarkColor = HexColor.fromHexColor('#080E1D');
  static const Color kBlackColor = Colors.black;
  static Color kBlackColorWithOpacity5 = Colors.black.withOpacity(0.5);
  static const Color kblueColor = Colors.blue;
  static const Color kgreyColor = Colors.grey;
  static Color kgreyColorShade300 = Colors.grey.shade300;
  static Color kgreyColorShade100 = Colors.grey.shade100;
  static const Color redColor = Colors.red;
}

extension HexColor on Color {
  static fromHexColor(String hexColor) {
    String hexColorReplace = hexColor.replaceAll("#", "");
    if (hexColorReplace.length == 6) {
      hexColorReplace = "FF" + hexColorReplace;
    }
    return Color(int.parse(hexColorReplace, radix: 16));
  }
}
