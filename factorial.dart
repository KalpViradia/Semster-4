import 'dart:io';

void main() {
  print("Enter a number: ");
  int n = int.parse(stdin.readLineSync()!);
  int sum = 1;
  for(int i=1; i<=n; i++) {
    sum = sum*i;
  }
  print("Factorial of $n is $sum");
}