import 'dart:io';

class Friend {
  String name;
  int phoneNumber;
  String email;

  Friend(this.name, this.phoneNumber, this.email);

  void display() {
    print('Name: $name');
    print('Phone Number: $phoneNumber');
    print('Email: $email');
  }
}

Map<String, Friend> friendsDictionary = {};

void main() {
  while (true) {
    print('Do you want to add a friend or search for one?');
    print('1. Add a friend');
    print('2. Search for a friend');
    print('3. Exit');
    stdout.write('Choose an option: ');

    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        addFriend();
        break;
      case 2:
        searchFriend();
        break;
      case 3:
        print('Exiting...');
        return;
      default:
        print('Invalid option, please try again.');
    }
  }
}

void addFriend() {
  stdout.write('Enter the name: ');
  String name = stdin.readLineSync()!;

  stdout.write('Enter the phone number: ');
  int phoneNumber = int.parse(stdin.readLineSync()!);

  stdout.write('Enter the email: ');
  String email = stdin.readLineSync()!;

  friendsDictionary[name] = Friend(name, phoneNumber, email);
  print('Friend added successfully');
}

void searchFriend() {
  stdout.write('Enter the name of the friend to search: ');
  String searchName = stdin.readLineSync()!;

  if (friendsDictionary.containsKey(searchName)) {
    friendsDictionary[searchName]!.display();
  } else {
    print('Friend not found.');
  }
}