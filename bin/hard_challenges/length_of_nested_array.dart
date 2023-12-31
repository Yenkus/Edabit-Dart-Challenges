import 'package:challenge_one/challenge_one.dart' as challenge_one;
import 'dart:io';

import 'package:test/test.dart';

void main(List<String> arguments) {
  // Length of a Nested Array
  int getLength(List list) {
    int itemCounter = 0;
    void checkItem(List list) {
      for (int i = 0; i < list.length; i++) {
        if (list[i] is List) {
          checkItem(list[i]);
        } else {
          itemCounter++;
        }
      }
    }

    if (list.isEmpty == true) {
      return itemCounter;
    } else {
      checkItem(list);
    }

    return itemCounter;
  }

  List list = [
    1,
    [
      2,
      3,
      [
        4,
        5,
        [
          6,
          [
            7,
            [
              8,
              [
                9,
                [10]
              ]
            ]
          ]
        ]
      ]
    ]
  ];
  print('number of items in the list: ${getLength(list)}');
}
