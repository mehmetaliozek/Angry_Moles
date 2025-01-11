import 'package:angry_moles/classes/constant_values.dart';
import 'package:angry_moles/models/settings_page_state_model.dart';
import 'package:angry_moles/state_manage/state_manager.dart';
import 'package:angry_moles/widgets/background.dart';
import 'package:angry_moles/widgets/setting_widgets/audio_settings.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends SettingsPageStateModel {
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AudioSettings(
            onChanged: (vol) {
              setState(() {
                StateManager.of(context)!
                    .preferences
                    .setData(
                      ConstantValues.keyThemeMusicVolume,
                      vol,
                    )
                    .whenComplete(() {
                  StateManager.of(context)!.setThemeMusicVolume(vol);
                  StateManager.of(context)!.themeMusic.setVolume(
                        StateManager.of(context)!.themeMusic.themeMusic,
                        vol,
                      );
                },);
              });
            },
            volume: StateManager.of(context)!.getThemeMusicVolume(),
            text: ConstantValues.themeMusic,
          ),
          AudioSettings(
            onChanged: (vol) {
              setState(() {
                StateManager.of(context)!
                    .preferences
                    .setData(
                      ConstantValues.keySfxVolume,
                      vol,
                    )
                    .whenComplete(
                      () => StateManager.of(context)!.setSfxVolume(vol),
                    );
                StateManager.of(context)!.sfx.setVolume(
                      StateManager.of(context)!.sfx.sfx,
                      vol,
                    );
              });
            },
            volume: StateManager.of(context)!.getSfxVolume(),
            text: ConstantValues.sfx,
          ),
        ],
      ),
    );
  }
}
