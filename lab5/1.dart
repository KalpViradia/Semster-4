import 'dart:io';

void main() {
  List numList = addInteger();
  sortList(numList);

  print('Enter sorted number are: $numList');
}

List addInteger() {
  List numList = [];
  for(int i = 1; i <= 5; i++) {
    print('Enter number$i: ');
    numList.add(int.parse(stdin.readLineSync()!));
  }
  return numList;
}

List sortList(List numList) {
   numList.sort();
   return numList;
}