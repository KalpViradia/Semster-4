import 'dart:io';
import 'dart:math';

void main() {
  print("Enter your weight in pounds: ");
  double pounds = double.parse(stdin.readLineSync()!);

  print("Enter your height in inches: ");
  double inches = double.parse(stdin.readLineSync()!);

  double weight = pounds / 2.20;
  double height = inches / 39.37;
  double bmi = weight / pow(height, 2);
  print("Your BMI is $bmi");
}
