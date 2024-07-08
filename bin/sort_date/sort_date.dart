import 'dart:math';

void main(List<String> arguments) {
  List<DateTime> listToSort = [
    DateTime(2024, 10, 06),
    DateTime.now(),
    DateTime(2013),
    DateTime(2000, 10, 06)
  ];
  print('Before sort: $listToSort');
  void sortList() {
    listToSort.sort((a, b) => a.compareTo(b));
  }

  sortList();
  print('Before sort: $listToSort');
}
