import 'dart:io';

void main() {
  int sum1 = 0;
  int sum2 = 0;
  print('Enter a number: ');
  int num = int.parse(stdin.readLineSync()!);
  while (num != 0) {
    if (num > 0 && num%2 == 0) {
      sum1 += num;
    }
    else if (num < 0 && num%2 != 0) {
      sum2 += num;
    }
    print('Enter a number: ');
    num = int.parse(stdin.readLineSync()!);
  }

  print('Sum of positive even numbers is: $sum1');
  print('Sum of negative odd numbers is: $sum2');
}