import 'dart:io';
import 'dart:math';

void main() {
  print("Enter a number: ");
  int n = int.parse(stdin.readLineSync()!);
  int n1 = n;
  int n2 = n;
  int digit = 0;
  double sum = 0;

  while(n1 != 0) {
    digit++;
    n1 = (n1/10).toInt();
  }
  for(int i=0; i<digit; i++) {
    sum += pow((n2%10), digit);
    n2 = (n2/10).toInt();
  }

  if(sum == n) {
    print("The number is a armstrong number.");
  }
  else {
    print("The number is not a armstrong number.");
  }
}
