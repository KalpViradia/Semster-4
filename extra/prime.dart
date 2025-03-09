import 'dart:io';

void main() {
  print("Enter a number: ");
  int n = int.parse(stdin.readLineSync()!);
  int count = 0;
  for(int i=1; i<n/2; i++) {
    if(n%i == 0) {
      count++;
    }
  }
  if(count == 1) {
    print("Prime Number");
  }
  else {
    print("Not Prime Number");
  }
}