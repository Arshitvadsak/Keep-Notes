import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color mainColor = Color(0xFF000633);
  static Color bgColor = Color(0xFF000633);
  static Color accentColor = Color(0xFF000633);

  static List<Color> cardsColor = [
    Color(0xffF5C6EC),
    Color(0xff408E91),
    Color(0xffF0EB8D),
    Color(0xffF0A04B),
    Color(0xffC1AEFC),
    Color(0xff698269),
    Color(0xff7286D3),
    Color(0xffB05A7A),
  ];

  static TextStyle mainTitle =
      GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold);

  static TextStyle mainContent =
      GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.normal);

  static TextStyle DataTitle =
      GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.bold);
}
