import 'dart:io';

void main() {
  print('Enter the number: ');
  String num = stdin.readLineSync()!;

  String reversed = num.split('').reversed.join('');
  print('The reversed number is: $reversed');
}