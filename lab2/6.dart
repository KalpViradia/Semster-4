import 'dart:io';

void main() {
  print('Enter the expression: ');
  String expression = stdin.readLineSync()!;
  List<String> tokens = expression.split(' ');

  for (int i = 0; i < tokens.length; i++) {
    if (tokens[i] == '*' || tokens[i] == '/') {
      double operand1 = double.parse(tokens[i - 1]);
      double operand2 = double.parse(tokens[i + 1]);
      double result;

      switch (tokens[i]) {
        case '*':
          result = operand1 * operand2;
          break;
        case '/':
          if (operand2 == 0) {
            print('Error: Division by zero!');
            return;
          }
          result = operand1 / operand2;
          break;
        default:
          continue;
      }
      tokens.replaceRange(i - 1, i + 2, [result.toString()]);
      i--;
    }
  }

  for (int i = 0; i < tokens.length; i++) {
    if (tokens[i] == '+' || tokens[i] == '-') {
      double operand1 = double.parse(tokens[i - 1]);
      double operand2 = double.parse(tokens[i + 1]);
      double result;

      switch (tokens[i]) {
        case '+':
          result = operand1 + operand2;
          break;
        case '-':
          result = operand1 - operand2;
          break;
        default:
          continue;
      }
      tokens.replaceRange(i - 1, i + 2, [result.toString()]);
      i--;
    }
  }
  print('Result: ${tokens[0]}');
}