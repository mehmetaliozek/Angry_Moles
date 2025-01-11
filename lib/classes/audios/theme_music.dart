import 'package:angry_moles/classes/audios/audio.dart';
import 'package:angry_moles/classes/constant_values.dart';
import 'package:angry_moles/classes/preferences.dart';
import 'package:just_audio/just_audio.dart';

class ThemeMusic extends Audio {
  final themeMusic = AudioPlayer();
  final String assetPath;

  ThemeMusic(Preferences preferences, {required this.assetPath}) {
    setAsset(themeMusic, assetPath).whenComplete(
      () => setLoop(themeMusic, LoopMode.all).whenComplete(
        () => preferences.getData(ConstantValues.keyThemeMusicVolume).then(
          (volume) {
            setVolume(themeMusic, volume).whenComplete(
              () {
                play(themeMusic);
              },
            );
          },
        ),
      ),
    );
  }
}
