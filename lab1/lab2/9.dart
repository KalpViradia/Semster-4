void main() {
  List<int> nums = [2, 2, 1, 1, 1, 2, 2];
  int candidate = -1;
  int count = 0;

  for (int i = 0; i < nums.length; i++) {
    if (count == 0) {
      candidate = nums[i];
    }
    count += (nums[i] == candidate) ? 1 : -1;
  }

  print('Majority number is $candidate');
}