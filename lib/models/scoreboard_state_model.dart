import 'dart:async';

import 'package:angry_moles/state_manage/state_manager.dart';
import 'package:angry_moles/classes/constant_values.dart';
import 'package:angry_moles/widgets/game_widgets/scoreboard.dart';
import 'package:flutter/material.dart';

abstract class ScoreBoardStateModel extends State<ScoreBoard> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => getHighScore(),
    );

    _timer = Timer.periodic(
      const Duration(milliseconds: ConstantValues.waitDuration),
      (time) {

        setState(() {
          StateManager.of(context)!
              .setTime(StateManager.of(context)!.getTime() - 1);
          if (StateManager.of(context)!.getTime() == 0) {
            setHighScore();
            _timer.cancel();
          }
        });
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Future<void> getHighScore() async {
    await StateManager.of(context)!
        .preferences
        .getData(ConstantValues.keyHighScore)
        .then((value) => StateManager.of(context)!.setHighScore(value.toInt()));
  }

  Future<void> setHighScore() async {
    await StateManager.of(context)!.preferences.setData(
          ConstantValues.keyHighScore,
          StateManager.of(context)!.getHighScore() as double,
        );
  }
}
