import 'dart:io';

void main() {
  List<int> numList = addInteger();
  int sum = sumList(numList);

  print('Enter sum number are: $sum');
}

List<int> addInteger() {
  print('Enter the length of list: ');
  int n = int.parse(stdin.readLineSync()!);
  List<int> numList = [];
  for(int i = 1; i <= n; i++) {
    print('Enter number$i: ');
    numList.add(int.parse(stdin.readLineSync()!));
  }
  return numList;
}

int sumList(List<int> numList) {
  int n = numList.length;
  int sum = 0;
  for(int i = 0; i < n; i++) {
    if(numList[i]%3 == 0 || numList[i]%5 == 0) {
      sum += numList[i];
    }
  }
  return sum;
}