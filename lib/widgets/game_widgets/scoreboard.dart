import 'package:angry_moles/state_manage/state_manager.dart';
import 'package:angry_moles/classes/constant_values.dart';
import 'package:angry_moles/models/scoreboard_state_model.dart';
import 'package:angry_moles/widgets/custom_widgets/text.dart';
import 'package:flutter/material.dart';

class ScoreBoard extends StatefulWidget {
  const ScoreBoard({super.key});

  @override
  State<ScoreBoard> createState() => _ScoreBoardState();
}

class _ScoreBoardState extends ScoreBoardStateModel {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              "${ConstantValues.score} ${StateManager.of(context)!.getScore()}",
              fontSize: ConstantValues.scoreBoardFontSize(context),
            ),
            CustomText(
              "${ConstantValues.highScore} ${StateManager.of(context)!.getHighScore()}",
              fontSize: ConstantValues.scoreBoardFontSize(context),
            ),
          ],
        ),
        CustomText(
          "${ConstantValues.time} ${StateManager.of(context)!.getTime() > 60 ? 60 : StateManager.of(context)!.getTime()}",
          fontSize: ConstantValues.scoreBoardFontSize(context),
        ),
      ],
    );
  }
}
