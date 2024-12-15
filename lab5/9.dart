import 'dart:io';

void main() {
  List<int> numList = addInteger();

  List<int> uniqueList = removeDuplicates(numList);

  print('The list of unique integers is: $uniqueList');
}

List<int> addInteger() {
  print('Enter the length of list: ');
  int n = int.parse(stdin.readLineSync()!);
  List<int> numList = [];
  for (int i = 1; i <= n; i++) {
    print('Enter number$i: ');
    numList.add(int.parse(stdin.readLineSync()!));
  }
  return numList;
}

List<int> removeDuplicates(List<int> numList) {
  int n = numList.length;
  List<int> uniqueNums = [];
  Map<int, bool> map = {};

  for (int i = 0; i < n; i++) {
    map[numList[i]] = true;
  }

  uniqueNums.addAll(map.keys);
  uniqueNums.sort();

  return uniqueNums;
}
