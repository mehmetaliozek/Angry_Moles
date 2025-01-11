import 'package:angry_moles/state_manage/state_manager.dart';
import 'package:angry_moles/classes/constant_values.dart';
import 'package:angry_moles/models/game_over_state_model.dart';
import 'package:angry_moles/screens/game_page.dart';
import 'package:angry_moles/widgets/custom_widgets/button.dart';
import 'package:angry_moles/widgets/custom_widgets/text.dart';
import 'package:flutter/material.dart';

class GameOver extends StatefulWidget {
  const GameOver({super.key});

  @override
  State<GameOver> createState() => _GameOverState();
}

class _GameOverState extends GameOverStateModel {
  @override
  Widget build(BuildContext context) {
    if (timerIsActive()) {
      return const SizedBox.shrink();
    } else {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Center(
                child: CustomText(
                  "${ConstantValues.yourScore}\n${StateManager.of(context)!.getScore()}",
                  fontSize: ConstantValues.titleFontSize(context, 3),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  CustomButton(
                    onPressed: () {
                      StateManager.of(context)!.resetValue();
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (context, _, __) => const GamePage(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      );
                    },
                    text: ConstantValues.playAgain,
                  ),
                  CustomButton(
                    onPressed: () {
                      StateManager.of(context)!.resetValue();
                      Navigator.of(context).pop();
                    },
                    text: ConstantValues.exit,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
