mixin Settings {
  static double _themeMusicVolume = 0.0;
  double getThemeMusicVolume() => _themeMusicVolume;
  void setThemeMusicVolume(double value) => _themeMusicVolume = value;

  static double _sfxVolume = 0.0;
  double getSfxVolume() => _sfxVolume;
  void setSfxVolume(double value) => _sfxVolume = value;
}
