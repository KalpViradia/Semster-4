import 'dart:io';

void main() {
  print("Enter the first sorted list of integers: ");
  String? input1 = stdin.readLineSync();

  print("Enter the second sorted list of integers:");
  String? input2 = stdin.readLineSync();

  List<int> nums1 = input1?.split(' ').map((e) => int.parse(e)).toList() ?? [];
  List<int> nums2 = input2?.split(' ').map((e) => int.parse(e)).toList() ?? [];

  List<int> result = intersection(nums1, nums2);

  print("Intersection: $result");
}

List<int> intersection(List<int> nums1, List<int> nums2) {

  nums1.sort();
  nums2.sort();

  List<int> result = [];
  int i = 0, j = 0;

  while (i < nums1.length && j < nums2.length) {
    if (nums1[i] == nums2[j]) {
      result.add(nums1[i]);
      i++;
      j++;
    } else if (nums1[i] < nums2[j]) {
      i++;
    } else {
      j++;
    }
  }

  return result;
}