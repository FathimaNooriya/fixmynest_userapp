import 'package:flutter/material.dart';
import '../../../../core/color_and_font/color_and_font.dart';
import '../../../../core/padding.dart';

class TextRightWidget extends StatelessWidget {
  TextRightWidget({
    super.key,
    required this.rightText,
    required this.buttonFunction,
    required this.navContext,
  });
  final String rightText;
  final Widget buttonFunction;
  BuildContext navContext;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: Paddings.myPadding,
        child: TextButton(
          onPressed: () {
               Navigator.of(context).push(
                    MaterialPageRoute(builder: (navContext) => buttonFunction));
          },
          child: Text(
            rightText,
            style: ColorAndFont.RIGHT_TEXT,
          ),
        ),
      ),
    );
  }
}
