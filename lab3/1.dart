import 'dart:io';

void main() {
  print('Enter the staring value: ');
  int n = int.parse(stdin.readLineSync()!);
  print('Enter the ending value: ');
  int m = int.parse(stdin.readLineSync()!);
  List validNums = [];

  for (int i = n; i <= m; i++) {
    if (i%2 == 0 && i%3 != 0) {
      validNums.add(i);
    }
  }

  print('The valid numbers are: $validNums');
}