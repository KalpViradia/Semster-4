import 'dart:io';

void main() {
  print("Enter the temperature in Fahrenheit: ");
  double f = double.parse(stdin.readLineSync()!);
  double c = (f-32)/1.8;
  print("The temperature $f °f to celsius is $c °c");
}