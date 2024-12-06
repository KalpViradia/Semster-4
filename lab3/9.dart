import 'dart:io';

void main() {
  print("Enter the elements of the array separated by space:");
  String input = stdin.readLineSync()!;
  List<String> inputArray = input.split(' ');
  List<int> array = inputArray.map(int.parse).toList();

  print("Enter the element to insert:");
  int element = int.parse(stdin.readLineSync()!);

  print("Enter the position to insert the element:");
  int position = int.parse(stdin.readLineSync()!);

  if (position < 0 || position > array.length) {
    print("Invalid position!");
  } else {
    array.insert(position, element);
  }

  print("Modified array: $array");
}