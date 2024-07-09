import 'package:challenge_one/challenge_one.dart' as challenge_one;
import 'dart:io';

void main(List<String> arguments) {
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
