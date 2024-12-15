import 'dart:io';

void main() {
  List list1 = addInteger();
  List list2 = addInteger();

  List commonList = checkCommon(list1, list2);

  print('The common elements of the list are: $commonList');
}

List addInteger() {
  print('Enter the length of list: ');
  int n = int.parse(stdin.readLineSync()!);
  List numList = [];
  for(int i = 1; i <= n; i++) {
    print('Enter number$i: ');
    numList.add(int.parse(stdin.readLineSync()!));
  }
  return numList;
}

List checkCommon(List list1, List list2) {
  int n1 = list1.length;
  int n2 = list2.length;
  List list = [];

  for(int i = 0; i < n1; i++) {
    for(int j = 0; j < n2; j++) {
      if(list1[i] == list2[j]) {
        list.add(list1[i]);
        break;
      }
    }
  }

  return list;
}