import 'package:just_audio/just_audio.dart';

abstract class Audio {
  Future<void> setAsset(AudioPlayer player, String assetPath) async {
    await player.setAsset(assetPath);
  }

  Future<void> setLoop(AudioPlayer player, LoopMode mode) async {
    await player.setLoopMode(mode);
  }

  Future<void> play(AudioPlayer player) async {
    await player.play();
  }

  Future<void> stop(AudioPlayer player) async {
    await player.stop();
  }

  Future<void> setVolume(AudioPlayer player, double volume) async {
    await player.setVolume(volume);
  }
}
