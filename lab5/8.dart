import 'dart:io';

void main() {
  print('Enter a number: ');
  String num = stdin.readLineSync()!;

  String result = largestOddSubstring(num);
  if(result.isEmpty) {
    print('No odd number found');
  }
  else {
    print('The largest odd number is $result');
  }
}

String largestOddSubstring(String num) {
  for (int length = num.length; length > 0; length--) {
    for (int start = 0; start <= num.length - length; start++) {

      String substring = num.substring(start, start + length);

      if (int.parse(substring[substring.length - 1]) % 2 != 0) {
        return substring;
      }
    }
  }

  return '';
}