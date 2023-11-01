import 'package:flutter/material.dart';
import '../../../../core/color_and_font/color_and_font.dart';
import '../../../../core/padding.dart';

class TextRightWidget extends StatelessWidget {
  const TextRightWidget({
    super.key,
    required this.rightText,
  });
  final String rightText;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: Paddings.myPadding,
        child: Text(
          rightText,
          style: ColorAndFont.RIGHT_TEXT,
        ),
      ),
    );
  }
}
