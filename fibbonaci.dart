import 'dart:io';

void main() {
  print("Enter a number: ");
  int n = int.parse(stdin.readLineSync()!);
  int a = 0;
  int b = 1;
  int c = 0;
  print("Fibbonaci series till $n terms is");
  for(int i=0; i<n; i++) {
    stdout.write("$a ");
    c = a+b;
    a = b;
    b = c;
  }
}