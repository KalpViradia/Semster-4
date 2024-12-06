import 'dart:io';

void main() {
  print('Enter the sentence: ');
  String sentence = stdin.readLineSync()!;
  Map<String, int> wordCount = {};
  List<String> words = sentence.split(' ');

  for (String word in words) {
    wordCount[word] = (wordCount[word] ?? 0) + 1;
  }

  print(wordCount);
}