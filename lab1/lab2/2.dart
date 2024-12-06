import 'dart:io';

void main() {
  print('Enter the first number: ');
  int n1 = int.parse(stdin.readLineSync()!);
  print('Enter the second number: ');
  int n2 = int.parse(stdin.readLineSync()!);
  print('Enter the operator: ');
  String operator = stdin.readLineSync()!;

  if (operator == '+') {
    print('The addition of $n1 and $n2 is ${n1+n2}');
  }
  else if (operator == '-') {
    print('The subtraction of $n2 from $n1 is ${n1-n2}');
  }
  else if (operator == '*') {
    print('The multiplication of $n1 and $n2 is ${n1*n2}');
  }
  else if (operator == '/') {
    print('The division of $n1 by $n2 is ${n1/n2}');
  }
  else {
    print('Invalid Operator');
  }

  switch (operator) {
    case '+' : {
      print('The addition of $n1 and $n2 is ${n1+n2}');
    }
    case '-' : {
      print('The subtraction of $n2 from $n1 is ${n1-n2}');
    }
    case '*' : {
      print('The multiplication of $n1 and $n2 is ${n1*n2}');
    }
    case '/' : {
      print('The division of $n1 by $n2 is ${n1/n2}');
    }
    default: {
      print('Invalid Operator');
    }
  }
}