import 'dart:io';

void main() {
  List<int> nums = addInteger();

  stdout.write('Enter the target value: ');
  int target = int.parse(stdin.readLineSync()!);

  List<int> result = twoSum(nums, target);

  if (result.isEmpty) {
    print('No solution found.');
  } else {
    print('The indices of the two numbers are: $result');
  }
}

List<int> addInteger() {
  print('Enter the length of list: ');
  int n = int.parse(stdin.readLineSync()!);
  List<int> numList = [];
  for(int i = 1; i <= n; i++) {
    print('Enter number$i: ');
    numList.add(int.parse(stdin.readLineSync()!));
  }
  return numList;
}

List<int> twoSum(List<int> nums, int target) {
  Map<int, int> numMap = {};

  for (int i = 0; i < nums.length; i++) {
    int complement = target - nums[i];
    if (numMap.containsKey(complement)) {
      return [numMap[complement]!, i];
    }
    numMap[nums[i]] = i;
  }

  return [];
}