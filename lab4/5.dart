import 'dart:io';

void main() {
  print("Enter numbers separated by spaces:");
  String? input = stdin.readLineSync();
  if (input != null && input.isNotEmpty) {
    List<int> n = input.split(' ').map(int.parse).toList();
    countOddEven(n);
  } else {
    print("No input provided!");
  }
}

void countOddEven(List<int> n) {
  int even = 0;
  int odd = 0;

  for (int i = 0; i < n.length; i++) {
    if (n[i] % 2 == 0) {
      even++;
    } else {
      odd++;
    }
  }

  print("Even count: $even");
  print("Odd count: $odd");
}