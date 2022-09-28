
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleFontSer {
  static final GoogleFontSer _ser = GoogleFontSer._internal();
  factory GoogleFontSer() => _ser;
  GoogleFontSer._internal();

  TextStyle leckerliOne(TextStyle textStyle) =>
      GoogleFonts.leckerliOne(textStyle: textStyle);
}