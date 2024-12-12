import 'dart:io';

void main(){
  print('Enter principal amount: ');
  double p = double.parse(stdin.readLineSync()!);
  print('Enter rate: ');
  double r = double.parse(stdin.readLineSync()!);
  print('Enter time: ');
  double t = double.parse(stdin.readLineSync()!);
  double si = simpleinterest(p, r, t);
  print('The simple interest is $si');
}

double simpleinterest(double p,double r,double t){
  return (p * r * t)/100;
}