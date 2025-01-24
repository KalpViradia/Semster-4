import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Crud(),
  ));
}

class Crud extends StatefulWidget {
  const Crud({Key? key}) : super(key: key);

  @override
  State<Crud> createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<User> users = [];
  List<User> filteredUsers = [];
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    searchController.addListener(_filterUsers);
    filteredUsers = users;
  }

  @override
  void dispose() {
    searchController.dispose();
    nameController.dispose();
    contactController.dispose();
    super.dispose();
  }

  void _filterUsers() {
    setState(() {
      filteredUsers = users
          .where((user) =>
              user.name
                  .toLowerCase()
                  .contains(searchController.text.toLowerCase()) ||
              user.contactNo
                  .toLowerCase()
                  .contains(searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: 'Enter Name',
                      labelText: 'Enter Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: contactController,
                    decoration: const InputDecoration(
                      hintText: 'Enter Contact No.',
                      labelText: 'Enter Contact No.',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        foregroundColor: Colors.white),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          if (selectedIndex == -1) {
                            users.add(User(
                              name: nameController.text.trim(),
                              contactNo: contactController.text.trim(),
                            ));
                          } else {
                            users[selectedIndex] = User(
                              name: nameController.text.trim(),
                              contactNo: contactController.text.trim(),
                            );
                          }
                          filteredUsers = users;
                          nameController.clear();
                          contactController.clear();
                          selectedIndex = -1;
                        });
                      }
                    },
                    child: Text(selectedIndex == -1 ? 'Save' : 'Update'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: searchController,
              decoration: const InputDecoration(
                hintText: 'Search by Name or Contact No.',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: filteredUsers.isEmpty
                  ? const Text(
                      'No User found',
                      style: TextStyle(fontSize: 22, color: Colors.blueGrey),
                    )
                  : ListView.builder(
                      itemCount: filteredUsers.length,
                      itemBuilder: (context, index) => getRow(index),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              filteredUsers[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(filteredUsers[index].contactNo),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  nameController.text = filteredUsers[index].name;
                  contactController.text = filteredUsers[index].contactNo;
                  selectedIndex = users.indexOf(filteredUsers[index]);
                });
              },
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Confirm Delete'),
                    content: const Text(
                        'Are you sure you want to delete this user?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            users.remove(filteredUsers[index]);
                            filteredUsers = users;
                            if (selectedIndex == index) {
                              selectedIndex = -1;
                              nameController.clear();
                              contactController.clear();
                            }
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text('Delete'),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  String name;
  String contactNo;
  User({required this.name, required this.contactNo});
}
