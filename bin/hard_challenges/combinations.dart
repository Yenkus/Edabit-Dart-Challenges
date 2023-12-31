void main(List<String> arguments) {
  // Combinations

  // Dart doesn't have the variable argument that js has
  // so I improvised with list
  int combinations(List<int> args) {
    int value = 1;
    for (int i = 0; i < args.length; i++) {
      value *= args[i];
    }
    return value;
  }

  print('combination: ${combinations([2, 3, 4, 5])}');
}
