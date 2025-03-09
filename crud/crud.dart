import 'dart:io';

class User {
  List<Map<String, dynamic>> userList = [];

  void addUser({required name, required age, required email}) {
    Map<String, dynamic> map = {};
    map["Name"] = name;
    map["Age"] = age;
    map["Email"] = email;

    userList.add(map);
  }

  List<Map<String, dynamic>> getUser() {
    return userList;
  }

  void updateUser({required name, required age, required email, required id}) {
    Map<String, dynamic> map = {};
    map["Name"] = name;
    map["Age"] = age;
    map["Email"] = email;

    if(id > userList.length) {
      print('Invalid id');
    }
    else{
      userList[id] = map;
    }
  }

  void deleteUser({required name,}) {
    int id = 0;
    for (var element in userList) {
      if(element["Name"] == name) {
        id = userList.indexOf(element);
      }
    } 
    userList.removeAt(id);
  }
}

void main() {
  User user = User();

  int choice = 0;
  do{
    print('Enter your choice of operation:'
        '\n1. Add'
        '\n2. Get'
        '\n3. Update'
        '\n4. Delete'
        '\n5. Exit');
    choice = int.parse(stdin.readLineSync()!);

    switch(choice){
      case 1:
        print('Enter the name: ');
        String name = stdin.readLineSync()!;

        print('Enter the age: ');
        int age = int.parse(stdin.readLineSync()!);

        print('Enter the email: ');
        String email = stdin.readLineSync()!;

        user.addUser(name: name, age: age, email: email);

        print('User added');
        break;

      case 2:
        List<Map<String, dynamic>> userList = user.getUser();
        for (var element in userList) {
          print('Name: ${element["Name"]}, Age: ${element["Age"]}, Email: ${element["Email"]} \n');
        }
        break;

      case 3:
        print('Enter the name: ');
        String name = stdin.readLineSync()!;

        print('Enter the age: ');
        int age = int.parse(stdin.readLineSync()!);

        print('Enter the email: ');
        String email = stdin.readLineSync()!;

        print('Enter the id: ');
        int id = int.parse(stdin.readLineSync()!);

        user.updateUser(name: name, age: age, email: email, id: id);

        print('User updated');
        break;

      case 4:
        print('Enter the name: ');
        String name = stdin.readLineSync()!;

        user.deleteUser(name: name);

        print('User deleted');
        break;

      case 5:
        print('Exiting...');
        break;
    }

  }while(choice != 5);
}