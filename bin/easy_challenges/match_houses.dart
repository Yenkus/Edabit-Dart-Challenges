void main(List<String> arguments) {
  // print('Hello world: ${challenge_one.calculate()}!');

  // Matchstick Houses #easy
  print('Enter your number');
  // Trying to read in input values
  // int? step = int.parse(stdin.readLineSync()!);

  // print(step);

  void matchHouses(int step) {
    if (step > 0) {
      int matchSticks = (step * 5) + 1;
      // (step - 1)~/5;
      print('matchstick: $matchSticks');
    } else if (step == 0) {
      print('0 match sticks');
    }
  }

  matchHouses(87);
}
