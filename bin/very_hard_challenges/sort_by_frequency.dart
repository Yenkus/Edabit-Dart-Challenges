import 'dart:math';

void main() {
  // Sort by Frequency

  void sortFreq(List<int> list) {
    Map numberSet = {};
    Map sortMap = {};
    List holdList = [];
    List resultList = [];

    for (int i = 0; i < list.length; i++) {
      int tempValue = list[i];
      if (tempValue >= 0 && tempValue <= 9) {
        if (numberSet.containsKey(tempValue)) {
          numberSet[tempValue]++;
        } else {
          numberSet[tempValue] = 1;
        }
      } else {
        print('Invalid input: $tempValue');
      }
    }

    for (int i = 0; i <= 9; i++) {
      if (numberSet.containsKey(i)) {
        sortMap[i] = numberSet[i];
      }
    }

    // void sortToList(){}
    for (int i = list.length; i > 0; i--) {
      for (int j = 0; j <= 9; j++) {
        if (numberSet.containsKey(j)) {
          //print('i: $i, j: $j, $numberSet');
          if (i == numberSet[j]) {
            holdList.add(j);
          }
        }
      }
    }

    // First method tried
    // for (int i = 0; i <= 9; i++) {
    //   int? key;

    //   // checks if the numberset has the value
    //   if (numberSet.containsKey(i)) {
    //     // check if the numberset value is greater than the current max value
    //     if (numberSet[i] > currentMaxNumber) {
    //       currentMaxNumber = numberSet[i];
    //       key = i;

    //       for (int j = 0; j < currentMaxNumber; j++) {
    //         // insert most frequent occuring number at the fore front
    //         copySet.insert(0, key);
    //       }
    //     } else {
    //       key = i;
    //       // insert
    //       for (int k = 0; k < numberSet[i]; k++) {
    //         copySet.add(key);
    //       }
    //     }
    //   } else {
    //     print('Does not contain key: $i');
    //   }
    // }
    for (int i = 0; i < holdList.length; i++) {
      int key = holdList[i];
      int value = numberSet[key];
      for (int j = 0; j < value; j++) {
        resultList.add(key);
      }
    }
    print(list);
    // print(numberSet);
    // print(sortList);
    // print(holdList);
    print(resultList);
  }

  sortFreq(
    [1, 2, 3, 0, 5, 0, 1, 6, 8, 8, 6, 9, 1],
  );
}
