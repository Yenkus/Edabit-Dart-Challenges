void main(List<String> arguments) {
  // frequency_by_level_of_nesting

  Map levelValues = {};
  int level = 0;
  int nestedLevel = 0;

  void elementCounter(
      {required List list, required int element, required int level}) {
    // nestedLevel++;
    // levelValues[level] = 0;
    print('recursive level: $level');
    for (int i = 0; i < list.length; i++) {
      print(' element: ${list[i]}');
      if (list[i] == element) {
        print('It equals element');
        if (levelValues.containsKey(level)) {
          levelValues[level]++;
          print('increment level: $level');
        } else {
          print('Added to level: $level');
          levelValues[level] = 1;
        }
      } else if (list[i] is List) {
        // nestedLevel++;
        print('This is a list');
        if (levelValues.containsKey(level + 1) == false) {
          levelValues[level + 1] = 0;
        }

        elementCounter(list: list[i], element: element, level: level + 1);
      } else {
        print('${list[i]} is neither the element nor a list');
      }
    }
  }

  void freqCount({
    required List list,
    required int element,
  }) {
    levelValues = {};
    level = 0;
    nestedLevel = 0;
    levelValues[0] = 0;
    elementCounter(list: list, element: element, level: level);
    print('nested level: $nestedLevel');
    print('levelValues: $levelValues');
  }

  freqCount(list: [
    1,
    4,
    4,
    [
      1,
      1,
      [1, 2, 1, 1]
    ]
  ], element: 1);

  freqCount(list: [
    1,
    5,
    5,
    [
      5,
      [1, 2, 1, 1],
      5,
      5
    ],
    5,
    [5]
  ], element: 5);
  freqCount(list: [
    1,
    [2],
    1,
    [
      [2]
    ],
    1,
    [
      [
        [2]
      ]
    ],
    1,
    [
      [
        [
          [2]
        ]
      ]
    ]
  ], element: 2);
}
