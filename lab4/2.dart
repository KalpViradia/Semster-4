import 'dart:io';

void main(){
  print("Enter the first number: ");
  int a = int.parse(stdin.readLineSync()!);
  print("Enter the second number: ");
  int b = int.parse(stdin.readLineSync()!);
  max_number(a, b);
}

void max_number(int a,int b){
  if(a > b){
    print("$a is greatest");
  }
  else{
    print("$b is greatest");
  }
}