import 'dart:math';

void main(List<String> arguments) {
  TaskKeys keys = TaskKeys();
  keys.generateKey(newTaskTitle: 'TaskKey', indexLevel: 1, keylist: []);
  print(keys._keysList);
  // print(keys.generateKey(newTaskTitle: 'TaskKey', indexLevel: 4));
}

class TaskKeys {
  List<String> _keysList = [];

  void get keysList => _keysList;
  // String TaskKey;
  // TaskKeys({required this.TaskKey});
  // int indexLevel;
  // TaskKeys({required this.newTaskTitle, required this.indexLevel});

  String _key = '';
  // Generate random numbers
  String _generateRandomNumbers({required int max, required int min}) {
    int number;
    number = Random().nextInt(max) + min;
    return number.toString();
  }

  // Generates random text
  String _generateRanomVowel() {
    // Get a random letter from the list of vowels
    String letter = _vowels[Random().nextInt(_vowels.length)];
    if (Random().nextInt(10) % 2 == 0) {
      return letter.toUpperCase();
    }
    return letter;
  }

  // Generates random text
  String _generateRanomConsonant() {
    // Get a random letter from the list of vowels
    String letter = _consonant[Random().nextInt(_consonant.length)];
    if (Random().nextInt(10) % 2 == 0) {
      return letter.toUpperCase();
    }
    return letter;
  }

  void _keyCompiler({
    required String taskTitle,
    required int max,
    required int min,
  }) {
    for (int q = 0; q < 10; q++) {
      _key = '';
      for (int i = 0; _key.length < 10; i++) {
        _key += _generateRanomConsonant();
        if (_key.length < 10) {
          _key += _generateRanomVowel();
          if (_key.length < 10) {
            _key += _generateRandomNumbers(max: max, min: min);
          }
        }
      }
      // Although it's going to be very difficult for two keys to be the same
      // it's not impossible there fore we avoid that possibility
      if (_keysList.contains(_key)) {
        _keyCompiler(
          taskTitle: taskTitle,
          max: max,
          min: min,
        );
      } else {
        _keysList.add(_key);
      }
    }
  }

  // REVIEW Key generator
  String generateKey(
      {required String newTaskTitle,
      required int indexLevel,
      required List<String> keylist}) {
    _keysList = keylist;
    if (indexLevel == 0) {
      _keyCompiler(taskTitle: newTaskTitle, min: 0, max: 10);
    } else if (indexLevel == 1) {
      _keyCompiler(taskTitle: newTaskTitle, min: 10, max: 50);
    } else if (indexLevel == 2) {
      _keyCompiler(taskTitle: newTaskTitle, min: 20, max: 100);
    } else if (indexLevel == 3) {
      _keyCompiler(taskTitle: newTaskTitle, min: 30, max: 150);
    } else {
      _keyCompiler(taskTitle: newTaskTitle, min: 40, max: 200);
    }
    return _key;
  }

  // When a task is completed the key should be moved to another
  // list named list of completd keys
  void moveKey() {}

  static const List _vowels = ['a', 'e', 'i', 'o', 'u'];

  static const List _consonant = [
    'b',
    'c',
    'd',
    'f',
    'g',
    'h',
    'j',
    'k',
    'l',
    'm',
    'n',
    'p',
    'q',
    'r',
    's',
    't',
    'v',
    'w',
    'x',
    'y',
    'z'
  ];
}
