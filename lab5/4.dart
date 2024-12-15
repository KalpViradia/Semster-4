import 'dart:io';

void main() {
  List<Map<String, dynamic>> phoneBook = [];

  while (true) {
    print('Phonebook Menu:');
    print('1. Add a new entry');
    print('2. View all entries');
    print('3. Exit');
    stdout.write('Choose an option: ');
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        phoneBook = addData(phoneBook);
        break;
      case 2:
        viewData(phoneBook);
        break;
      case 3:
        print('Exiting...');
        return;
      default:
        print('Invalid option, please try again.');
    }
  }
}

List<Map<String, dynamic>> addData(List<Map<String, dynamic>> phoneBook) {
  Map<String, dynamic> map = {};

  print('Enter the name: ');
  String name = stdin.readLineSync()!;

  print('Enter the phone number: ');
  int phone = int.parse(stdin.readLineSync()!);

  map['Name'] = name;
  map['Phone Number'] = phone;
  phoneBook.add(map);

  print('Entry added successfully!');
  return phoneBook;
}

void viewData(List<Map<String, dynamic>> phoneBook) {
  if (phoneBook.isEmpty) {
    print('Phonebook is empty.');
  } else {
    print('Phonebook Entries:');
    for (var entry in phoneBook) {
      print('Name: ${entry['Name']}, Phone Number: ${entry['Phone Number']}');
    }
  }
}