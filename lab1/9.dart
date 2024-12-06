import 'dart:io';

void main() {
  print('Enter the staring value: ');
  int n = int.parse(stdin.readLineSync()!);
  print('Enter the ending value: ');
  int m = int.parse(stdin.readLineSync()!);
  List primeNums = [];
  int count = 0;

  for (int i = n; i <= m; i++) {
    count = 0;
    for(int j=2; j<=i/2; j++) {
      if(i%j == 0) {
        count++;
        break;
      }
    }
    if(count == 0) {
      primeNums.add(i);
    }
  }

  print('The prime numbers are: $primeNums');
}