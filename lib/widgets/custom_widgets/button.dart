import 'package:angry_moles/classes/constant_values.dart';
import 'package:angry_moles/classes/theme_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: ConstantValues.padding),
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          fixedSize: Size.fromWidth(ConstantValues.width(context) * 0.5),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: ThemeColors.textColor,
          ),
        ),
      ),
    );
  }
}
