import 'dart:io';

void main() {
  double sum = 0;
  for (int i=1; i<6; i++) {
    print('Enter the marks of subject$i: ');
    sum += double.parse(stdin.readLineSync()!);
  }

  double result = sum/5;

  if (result < 35) {
    print('Fail');
  }
  else if (result >= 35 && result < 45) {
    print('Pass');
  }
  else if (result >= 45 && result < 60) {
    print('Second class');
  }
  else if (result >= 60 && result < 70) {
    print('First class');
  }
  else {
    print('Distinction');
  }
}