import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  print('Enter the string: ');
  String words = stdin.readLineSync()!;

  List<String> wordList = [];
  wordList = words.split(' ');

  print('The last word of the string is ${wordList.last.length}');
}