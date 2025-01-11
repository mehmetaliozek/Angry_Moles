import 'package:angry_moles/classes/constant_values.dart';
import 'package:angry_moles/screens/settings_page.dart';
import 'package:angry_moles/state_manage/state_manager.dart';
import 'package:flutter/material.dart';

abstract class SettingsPageStateModel extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => setState(() {
        getThemeMusicVolume();
        getSfxVolume();
      }),
    );
  }

  Future<void> getThemeMusicVolume() async {
    await StateManager.of(context)!
        .preferences
        .getData(ConstantValues.keyThemeMusicVolume)
        .then((value) => StateManager.of(context)!.setThemeMusicVolume(value));
  }

  Future<void> getSfxVolume() async {
    await StateManager.of(context)!
        .preferences
        .getData(ConstantValues.keySfxVolume)
        .then((value) => StateManager.of(context)!.setSfxVolume(value));
  }
}
