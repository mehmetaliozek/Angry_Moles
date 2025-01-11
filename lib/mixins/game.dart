mixin Game {
  static int _score = 0;
  int getScore() => _score;
  void setScore(int value) => _score = value;

  static int _highScore = 0;
  int getHighScore() => _highScore;
  void setHighScore(int value) => _highScore = value;

  static int _time = 65;
  int getTime() => _time;
  void setTime(int value) => _time = value;

  void resetValue() {
    _score = 0;
    _time = 65;
  }
}
