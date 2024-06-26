
import 'package:flutter/material.dart';
import '../../../core/color_and_font/color_and_font.dart';
import '../../../core/padding.dart';

class Tittles extends StatelessWidget {
  const Tittles({
    super.key,
    required this.tittle,
  });
  final String tittle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.myPadding,
      child: Text(tittle, style: ColorAndFont.TITTLE_TEXT),
    );
  }
}
