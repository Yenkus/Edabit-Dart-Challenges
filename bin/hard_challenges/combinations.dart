void main(List<String> arguments) {
  // Combinations

  // Dart doesn't have the variable argument that js has
  // so I improvised with list
  int combinations(List<int> args) {
    int value = 1;
    for (int i = 0; i < args.length; i++) {
      if (args[i] != 0) {
        value *= args[i];
        // args.reduce((value, element) => null)
      }
    }
    return value;
  }

  print('combination: ${combinations([2, 3, 4, 5])}');
  print('combination: ${combinations([6, 7, 0])}');
}
