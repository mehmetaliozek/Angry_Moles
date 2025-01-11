import 'dart:async';

import 'package:angry_moles/classes/constant_values.dart';
import 'package:angry_moles/widgets/game_widgets/countdown.dart';
import 'package:flutter/material.dart';

abstract class CountdownStateModel extends State<Countdown> {
  late Timer _timer;
  int countdown = 5;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(milliseconds: ConstantValues.waitDuration),
      (time) {
        setState(() {
          countdown--;
          if (countdown < 0) {
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
}
