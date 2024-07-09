void main(List<String> arguments) {
  // Numbers in Strings
  // without using RegEx

  void numInStr(List<String> list) {
    List tempList = [];
    bool hasNumber = false;
    for (int i = 0; i < list.length; i++) {
      hasNumber = false;
      for (int j = 0; j < list[i].length; j++) {
        var hold = list[i].substring(j, j + 1);
        // print(hold);

        switch (hold) {
          case '0':
            hasNumber = true;
            break;
          case '1':
            hasNumber = true;
            break;
          case '2':
            hasNumber = true;
            break;
          case '3':
            hasNumber = true;
            break;
          case '4':
            hasNumber = true;
            break;
          case '5':
            hasNumber = true;
            break;
          case '6':
            hasNumber = true;
            break;
          case '7':
            hasNumber = true;
            break;
          case '8':
            hasNumber = true;
            break;
          case '9':
            hasNumber = true;
            break;
          default:
            hasNumber = hasNumber;
        }
      }
      if (hasNumber == true) {
        tempList.add(list[i]);
      }
    }
    print(list);
    print(tempList);
  }

  // You are free to manipulate the list string as you wish as long as it is a string
  List<String> list = ['abc12d', 'asdf', 'q1w2', 'work', 't54es', '12345'];
  numInStr(list);
}
