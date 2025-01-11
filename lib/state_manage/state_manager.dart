import 'package:angry_moles/classes/preferences.dart';
import 'package:angry_moles/mixins/game.dart';
import 'package:angry_moles/classes/audios/sfx.dart';
import 'package:angry_moles/classes/audios/theme_music.dart';
import 'package:angry_moles/mixins/settings.dart';
import 'package:flutter/material.dart';

class StateManager extends InheritedWidget with Game, Settings {
  const StateManager({
    super.key,
    required child,
    required this.preferences,
    required this.themeMusic,
    required this.sfx,
  }) : super(child: child);

  final Preferences preferences;
  final ThemeMusic themeMusic;
  final SFX sfx;

  @override
  bool updateShouldNotify(StateManager oldWidget) {
    return true;
  }

  static StateManager? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<StateManager>());
  }
}
