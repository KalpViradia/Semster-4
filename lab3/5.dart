import 'dart:io';

void main() {
  print('Enter the string to reverse: ');
  String str = stdin.readLineSync()!;

  String reversed = str.split('').reversed.join('');
  print('The reversed string is: $reversed');
}