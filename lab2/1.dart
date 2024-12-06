import 'dart:io';

void main() {
  print('Enter a number: ');
  int n = int.parse(stdin.readLineSync()!);

  if (n == 0) {
    print('The number is zero');
  }
  else if (n > 0) {
    print('The number is Positive');
  }
  else {
    print('The number is Negative');
  }
}