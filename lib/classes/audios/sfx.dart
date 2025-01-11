import 'package:angry_moles/classes/audios/audio.dart';
import 'package:angry_moles/classes/constant_values.dart';
import 'package:angry_moles/classes/preferences.dart';
import 'package:just_audio/just_audio.dart';

class SFX extends Audio {
  final sfx = AudioPlayer();
  final String assetPath;

  SFX(Preferences preferences, {required this.assetPath}) {
    setAsset(sfx, assetPath).whenComplete(
      () => setLoop(sfx, LoopMode.one).whenComplete(
        () => preferences.getData(ConstantValues.keySfxVolume).then(
          (volume) {
            setVolume(sfx, volume);
          },
        ),
      ),
    );
  }
}
