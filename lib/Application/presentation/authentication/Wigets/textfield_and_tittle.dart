
import 'package:flutter/material.dart';
import '../../../../core/color_and_font/color_and_font.dart';
import '../../../../core/padding.dart';

class TextFirmFieldWithTitle extends StatelessWidget {
  const TextFirmFieldWithTitle({
    super.key,
    required this.textFeildTittle,
    required this.myController,
    required this.validatorFunction,
  });
  final String textFeildTittle;
  final TextEditingController myController;
  final Function validatorFunction;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.myPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              textFeildTittle,
              style: ColorAndFont.SM_TEXT,
            ),
          ),
          TextFormField(
            controller: myController,
            validator: (value) {
              return validatorFunction();
            },
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 2,
                  color: ColorAndFont.GREEN,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
