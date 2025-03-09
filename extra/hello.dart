import 'dart:io';

void main() {
  print("Hello World");
  print("Enter first number: ");
  int a = int.parse(stdin.readLineSync()!);
  print("Enter second number: ");
  int b = int.parse(stdin.readLineSync()!);
  print("Sum is: ${a+b}");
}