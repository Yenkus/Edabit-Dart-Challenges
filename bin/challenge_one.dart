import 'package:challenge_one/challenge_one.dart' as challenge_one;
import 'dart:io';

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

  // Tile Teamwork Tactics #medium
  bool possibleBonus(int myNum, int friendNum) {
    if (myNum > 0 && friendNum > 0) {
      for (int i = 1; i <= 6; i++) {
        if ((myNum + i) == friendNum) {
          return true;
        }
      }
    }
    return false;
  }

  print(possibleBonus(3, 7));

  // Function Factory
  Function makePlusFunction(int baseNumber) {
    return (int newInt) {
      return baseNumber + newInt;
    };
  }

  Function plusFive = makePlusFunction(5);

  print('plus five function: ${plusFive(-8)}');

  Function plusTen = makePlusFunction(10);

  print('Plus ten function: ${plusTen(0)}');

  print('Plus ten inside plus five function: ${plusFive(plusTen(0))}');

  // Bubble sort

  List list = [1, 8, 4, 6, 0, 3, 5, 2, 7, 9];
  int max = list.length;
  void display() {
    print(list);
  }

  void bubbleSort() {
    int temp;
    bool swapped = false;
    // loop through all numbers
    for (int i = 0; i < max - 1; i++) {
      swapped = false;
      // loop through numbers fallling ahead
      for (int j = 0; j < max - 1 - i; j++) {
        print('Items compared: [${list[j]}, ${list[j + 1]}]');
        // check if next number is lesser than current no
        // swap the numbers
        // (Bubble up the highest number)
        if (list[j] > list[j + 1]) {
          temp = list[j];
          list[j] = list[j + 1];
          list[j + 1] = temp;
          swapped = true;
          print('=> swapped [${list[j]}, ${list[j + 1]}]');
        } else {
          print('=> not swapped');
        }
      }
      // if no number was swapped that means
      // array is sorted now, break the loop.
      if (swapped == false) {
        break;
      }
      print('Iteration ${i + 1}, #: ');
      display();
    }
  } // End of bubbleSort

  print('Input List: ');
  display();
  bubbleSort();
  print('Output List: ');
  display();
}
