void main(List<String> arguments) {
  // Tile Teamwork Tactics #medium
  bool possibleBonus(int myNum, int friendNum) {
    if (myNum >= 0 && friendNum >= 0) {
      for (int i = 1; i <= 6; i++) {
        if ((myNum + i) == friendNum) {
          return true;
        }
      }
    }
    return false;
  }

  print(possibleBonus(3, 7));
  print(possibleBonus(1, 9));
  print(possibleBonus(1, 9));
}
