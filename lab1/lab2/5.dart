import 'dart:io';

void main() {
  print('Enter the first number: ');
  int n1 = int.parse(stdin.readLineSync()!);
  print('Enter the second number: ');
  int n2 = int.parse(stdin.readLineSync()!);
  print('Enter the third number: ');
  int n3 = int.parse(stdin.readLineSync()!);

  if (n1 > n2 && n2 > n3) {
    print('The first number is largest');
  }
  else if (n2 > n1 && n2 > n3) {
    print('The second number is largest');
  }
  else {
    print('The third number is largest');
  }
}