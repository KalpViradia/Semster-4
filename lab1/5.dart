import 'dart:io';

void main() {
  print("Enter the distance in meters: ");
  double meter = double.parse(stdin.readLineSync()!);

  double feet = meter * 3.28;
  print("Enter distance in feet is $feet");
}