import 'dart:io';

void main() {
  print("Enter the first number: ");
  int a = int.parse(stdin.readLineSync()!);
  print("Enter the second number: ");
  int b = int.parse(stdin.readLineSync()!);

  print("The addition of $a and $b is ${a+b}.");
}