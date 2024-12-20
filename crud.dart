import 'dart:io';

class User {
  List<Map<String, dynamic>> userList = [];

  void addUserInList({required name, required age, required email}) {
    Map<String, dynamic> map = {};
    map["Name"] = name;
    map["Age"] = age;
    map["Email"] = email;
    userList.add(map);
  }

  List<Map<String, dynamic>> getUserList() {
    return userList;
  }

  void updateUser({required name, required age, required email, required id}) {
    Map<String, dynamic> map = {};
    map["Name"] = name;
    map["Age"] = age;
    map["Email"] = email;
    userList[id] = map;
  }

  void deleteUser(id) {
    userList.removeAt(id);
  }

  void searchDetails({required searchData}) {
    for (var element in userList) {
      if (element["Name"].toString().toLowerCase().contains(searchData.toString().toLowerCase()) ||
          element["Age"].toString().toLowerCase().contains(searchData.toString().toLowerCase()) ||
          element["Email"].toString().toLowerCase().contains(searchData.toString().toLowerCase())) {
        print('Name: ${element["Name"]}, Age: ${element["Age"]}, Email: ${element["Email"]}');
      }
    }
  }
}

void main() {
  User user = User();

  int choice;
  do {
    print('Select Your Choice From Below Available Options:'
        '\n1. Insert User'
        '\n2. List User'
        '\n3. Update User'
        '\n4. Delete User'
        '\n5. Search User'
        '\n6. Exit Application');
    choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 1:
      //region INSERT USER
        stdout.write('Enter Name: ');
        String name = stdin.readLineSync()!;
        stdout.write('Enter Age: ');
        int age = int.parse(stdin.readLineSync()!);
        stdout.write('Enter Email: ');
        String email = stdin.readLineSync()!;
        user.addUserInList(name: name, age: age, email: email);
        //endregion
        break;
      case 2:
      //region LIST USER
        List<Map<String, dynamic>> userList = user.getUserList();
        for (var element in userList) {
          print('Name: ${element["Name"]}, Age: ${element["Age"]}, Email: ${element["Email"]}');
        }
        //endregion
        break;
      case 3:
      //region UPDATE USER
        stdout.write('Enter Name: ');
        String name = stdin.readLineSync()!;
        stdout.write('Enter Age: ');
        int age = int.parse(stdin.readLineSync()!);
        stdout.write('Enter Email: ');
        String email = stdin.readLineSync()!;

        stdout.write('Enter Primary key: ');
        int index = int.parse(stdin.readLineSync()!);
        user.updateUser(name: name, age: age, email: email, id: index);
        //endregion
        break;
      case 4:
      //region DELETE USER
        stdout.write('Enter Primary key: ');
        int index = int.parse(stdin.readLineSync()!);
        user.deleteUser(index);
        //endregion
        break;
      case 5:
      //region SEARCH USER
        stdout.write('\nType Here To Search: ');
        String searchString = stdin.readLineSync()!;
        user.searchDetails(searchData: searchString);
        //endregion
        break;
      case 6:
        stdout.write('Thank You Visit Again');
        break;
      default:
        print('Invalid Choice Please Try Again');
        break;
    }
  } while (choice != 6);
}