import 'dart:math';

void main() {
  // Get Notes Distribution

  void getNotesDistribution(List list) {
    List tempList = [];
    Map resList = {};
    // Loop through the main list
    for (int i = 0; i < list.length; i++) {
      tempList = list[i]['notes'];
      // Loop through the note list
      for (int j = 0; j < tempList.length; j++) {
        int tempValue = tempList[j];
        // check if the tempValue is a valid value [1,2,3,4,5]
        if (tempValue > 0 && tempValue <= 5) {
          // check if the tempValue key already exist in the map list
          if (resList.containsKey(tempValue) == true) {
            resList[tempValue]++;
          }
          // check if the tempValue key doesn't exist in the map list
          else {
            resList[tempValue] = 1;
          }
        }
      }
    }
    Map sortList = {};
    print(resList.length);
    for (int i = 5; i > 0; i--) {
      if (resList.containsKey(i) == true) {
        // sortList.addEntries(i: resList[i]);
        sortList[i] = resList[i];
      } else {
        print('$i does not have a value');
      }
    }
    // for(int )
    print(sortList);
    // print(resList);
  }

  getNotesDistribution([
    {
      'name': 'Steve',
      // 'notes': [5, 5, 3, -1, 6, 4]
      'notes': [1, 1, 3, -1, 6, 4]
    },
    {
      'name': 'John',
      'notes': [3, 2, 5, 0, -3, 5, 5, 4, 2]
    }
  ]);
}
