import 'dart:async';

import 'package:angry_moles/state_manage/state_manager.dart';
import 'package:angry_moles/classes/constant_values.dart';
import 'package:angry_moles/widgets/game_widgets/game_over.dart';
import 'package:flutter/material.dart';

abstract class GameOverStateModel extends State<GameOver> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(milliseconds: ConstantValues.waitDuration),
      (time) {
        setState(() {
          if (StateManager.of(context)!.getTime() == 0) {
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

  bool timerIsActive() => _timer.isActive;
}
