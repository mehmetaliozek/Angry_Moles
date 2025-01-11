import 'package:angry_moles/state_manage/state_manager.dart';
import 'package:angry_moles/classes/paths.dart';
import 'package:angry_moles/classes/constant_values.dart';
import 'package:angry_moles/models/mole_state_model.dart';
import 'package:flutter/material.dart';

class Mole extends StatefulWidget {
  const Mole({super.key});

  @override
  State<Mole> createState() => _MoleState();
}

class _MoleState extends MoleStateModel {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (value) async {
        StateManager.of(context)!.resetValue();
      },
      child: GestureDetector(
        onTap: () {
          if (!getIsTap() && getIsClickable()) {
            setIsTap();
            timerCancel();
            hurtAnimation();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(ConstantValues.padding),
          child: Image(
            image: AssetImage(Paths.tile(getNumber())),
          ),
        ),
      ),
    );
  }
}
