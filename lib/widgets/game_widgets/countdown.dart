import 'package:angry_moles/classes/constant_values.dart';
import 'package:angry_moles/classes/theme_colors.dart';
import 'package:angry_moles/models/countdown_state_model.dart';
import 'package:flutter/material.dart';

class Countdown extends StatefulWidget {
  const Countdown({super.key});

  @override
  State<Countdown> createState() => _CountdownState();
}

class _CountdownState extends CountdownStateModel {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "${countdown >= 0 ? countdown : ""}",
        style: TextStyle(
          color: ThemeColors.textColor,
          fontSize: ConstantValues.titleFontSize(context, 1),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
