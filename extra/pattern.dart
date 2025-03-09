import 'dart:io';

void main() {
  print("Enter a number: ");
  int n = int.parse(stdin.readLineSync()!);

  for(int i=0; i<n; i++) {
    for(int j=n-i; j>1; j--) {
      stdout.write("  ");
    }
    for(int k=0; k<i*2-1; k++){
      stdout.write("* ");
    }
    print(" ");
  }
}