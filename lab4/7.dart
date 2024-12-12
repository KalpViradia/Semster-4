import 'dart:io';

void main() {
  print("Enter a sorted list of integers: ");
  String? input = stdin.readLineSync();

  List<int> nums = input?.split(' ').map((e) => int.parse(e)).toList() ?? [];
  int length = removeDuplicates(nums);

  print('Unique elements count is $length, Updated array is $nums');
}

int removeDuplicates(List<int> nums) {
  if (nums.isEmpty) {
    return 0;
  }

  int j = 1;
  for (int i = 1; i < nums.length; i++) {
    if (nums[i] != nums[i - 1]) {
      nums[j] = nums[i];
      j++;
    }
  }

  for (int i = j; i < nums.length; i++) {
    nums[i] = -1;
  }

  return j;
}