
import 'package:flutter/material.dart';
import '../../../../core/color_and_font/color_and_font.dart';
import '../../../../core/padding.dart';

class TextWithLink extends StatelessWidget {
  const TextWithLink({
    super.key,
    required this.bottomText,
    required this.linkText,
  });
  final String bottomText;
  final String linkText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.myPadding,
      child: Row(
        children: [
          Text(
            bottomText,
            style: ColorAndFont.Normal_TEXT,
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                linkText,
                style: ColorAndFont.Normal_TEXT_BOLD,
              ))
        ],
      ),
    );
  }
}
