import 'dart:io';

void main() {
  print("Enter the elements of the array separated by space:");
  String input = stdin.readLineSync()!;
  List<String> inputArray = input.split(' ');
  List<int> nums = inputArray.map(int.parse).toList();
  int uniqueNumber = 0;

  for (int i = 0; i < nums.length; i++) {
    uniqueNumber ^= nums[i];
  }

  print('Unique number is $uniqueNumber');
}