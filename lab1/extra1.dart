import 'dart:io';

void main() {
  print("Enter a number: ");
  int n = int.parse(stdin.readLineSync()!);

  if(n%5 == 0) {
    n = (n/5).toInt();
  }
  if(n%3 == 0) {
    n = (n/3).toInt();
  }
  if(n%2 == 0) {
    n = (n/2).toInt();
  }

  if(n == 1) {
    print("The number is a ugly number.");
  }
  else {
    print("The number is not a ugly number.");
  }
}