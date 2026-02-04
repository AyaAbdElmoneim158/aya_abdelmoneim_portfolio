import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color cardColor = Color(0XFF2A2A2A);
  static const Color backGroundColor = Color(0XFF161513);

  static const Color primary = Color(0XFFFFFFFF);
  static const List<Color> whiteGradient = [Color(0XFFFDFDFD), Color(0XFFFDFDFD)]; //Color.fromRGBO(255, 255, 255, 0.18)];
  static const List<Color> primaryGradient = [Color(0XFF9A33FF), Color(0XFFFF8660)];
  /*
  --primary: 195 100% 50%;
  --secondary: 280 100% 65%;
  -accent: 160 100% 50%;
  --destructive: 0 84% 60%;
   */
  static const List<Color> primaryGradient2 = [
    Color(0xFF00BFFF),
    Color(0xFFD580FF),
    Color(0xFF00FF80),
    Color(0xFFF66666),
  ];
  static const List<Color> primaryGradient3 = [
    Color(0xFF6B00FF),
    Color(0xFF9A33FF),
    Color(0xFFFFA060),
    Color(0xFFFF8660),
  ];
  static const List<List<Color>> palettes = [
    [Color(0xFF40C9FF), Color(0xFFE81CFF)],
    [Color(0xFF60EFFF), Color(0xFF00FF87)],
    [Color(0xFFFF0F7B), Color(0xFFF89B29)],
    [Color(0xFFFF1B6B), Color(0xFF45CAFF)],
    [Color(0xFF0061FF), Color(0xFF60EFFF)],
    [Color(0xFFED71AD), Color(0xFF7277F1)],
    // [Color(0xFF00BFFF), Color(0xFFC44DFF), Color(0xFF00FFAA)],
  ];

  static List<Color> orangeGradient = [Color(0xffFF8660), Color(0xffD5491D)];
  static List<Color> orangeGradient1 = [
    const Color(0xffFFB38A),
    const Color(0xffFF8660),
    const Color(0xffF45D22),
    const Color(0xffD5491D),
  ];

  static List<Color> blueGradient = [Color(0xff5BADFF), Color(0xff1373D1)];

  static const Color secondary = Color(0XFFC5C5C5);
  static const Color lightGray = Color(0XFF8491A0);
  static const Color lightBackGroundColor = Color(0XFF222222);
}
