void main(List<String> arguments) {
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
  // print('plus ten and five ${}')
}
