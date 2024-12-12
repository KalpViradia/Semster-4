import 'dart:io';

void main(){
  print("Enter a number:");
  int n = int.parse(stdin.readLineSync()!);
  int a = check(n);
  print(a);
}

int check(int n){
  int flag = 0;
  if(n == 0 || n == 1){
    flag = 1;
  }
  for(int i = 2; i <= n/2; i++){
    if(n%i == 0){
      flag++;
      break;
    }
  }
  if(flag == 0){
    return 1;
  }
  else{
    return 0;
  }
}