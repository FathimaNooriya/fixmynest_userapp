// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorAndFont {
  static const GREEN = Color.fromARGB(183, 2, 147, 67);
  static final TITTLE_TEXT = GoogleFonts.balooBhai2(
    textStyle: const TextStyle(
        color: GREEN, fontSize: 28, fontWeight: FontWeight.w700),
  );
  static final TITTLE_TEXT2 = GoogleFonts.balooBhai2(
    textStyle: const TextStyle(
        color: GREEN, fontSize: 25, fontWeight: FontWeight.w700),
  );
  static final SM_TEXT = GoogleFonts.balooBhai2(
      textStyle: const TextStyle(
          color: GREEN, fontSize: 12, fontWeight: FontWeight.w400));
  static final BUTTON_TEXT = GoogleFonts.balooBhai2(
    textStyle: const TextStyle(
        fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),
  );
  static final BUTTON_TEXT2 = GoogleFonts.balooBhai2(
    textStyle: const TextStyle(
        fontSize: 22, color: Colors.white, fontWeight: FontWeight.w600),
  );
  static final RIGHT_TEXT = GoogleFonts.balooBhai2(
    textStyle: const TextStyle(fontWeight: FontWeight.w600, color: GREEN),
  );
  static final Normal_TEXT = GoogleFonts.balooBhai2(
    textStyle: const TextStyle(fontWeight: FontWeight.w400, color: GREEN),
  );
  static final Normal_TEXT_BOLD = GoogleFonts.balooBhai2(
    textStyle: const TextStyle(fontWeight: FontWeight.w600, color: GREEN),
  );
  static final Normal_TEXT_Black = GoogleFonts.balooBhai2(
    textStyle: const TextStyle(
        fontWeight: FontWeight.w500, fontSize: 15, color: Colors.black),
  );
  static final Normal_TEXT_Black_BOLD = GoogleFonts.balooBhai2(
    textStyle: const TextStyle(
        fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black),
  );
  static final Tittle_TEXT_Black = GoogleFonts.balooBhai2(
    textStyle: const TextStyle(
        fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black),
  );
  static final Tittle_TEXT_Black_BOLD = GoogleFonts.balooBhai2(
    textStyle: const TextStyle(
        fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black),
  );
}
