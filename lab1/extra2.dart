import 'dart:io';

void main() {
  print("Enter a number: ");
  int n = int.parse(stdin.readLineSync()!);
  int sum = 0;

  for(int i=1; i<=n/2; i++) {
    if(n%i == 0) {
      sum += i;
    }
  }
  if(sum == n) {
    print("The number is a perfect number.");
  }
  else {
    print("The number is not a perfect number.");
  }
}
