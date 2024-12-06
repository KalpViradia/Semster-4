import 'dart:io';
import 'dart:math';

void main() {
  print('Enter the Hour: ');
  double hour = double.parse(stdin.readLineSync()!);
  print('Enter the minute: ');
  double minute = double.parse(stdin.readLineSync()!);

  double hourDegree = hour*30 + minute*0.5;
  double minuteDegree  = minute*6;

  double  diff = hourDegree - minuteDegree;
  print('The Angle between the hands of the clock is $diff');
}