import 'package:flutter/material.dart';

import '../../crud/api/api_service.dart';
import '../../crud/api/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter API Fetching Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserListScreen(),
    );
  }
}

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late Future<List<User>> users;

  @override
  void initState() {
    super.initState();
    users = ApiService().getAllUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<List<User>>(
        future: users,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No users found.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var user = snapshot.data![index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.id),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            // Edit User
                            showEditUserDialog(context, user);
                          },
                          icon: Icon(Icons.edit),
                          color: Colors.blue,
                        ),
                        IconButton(
                          onPressed: () async {
                            // Delete User
                            await ApiService().deleteUser(user.id).then(
                                    (value) => setState(() {
                                  users = ApiService().getAllUser();
                                }));
                          },
                          icon: Icon(Icons.delete),
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddUserDialog(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Future<void> showAddUserDialog(BuildContext context) async {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New User'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () async {
                if (nameController.text.isNotEmpty &&
                    emailController.text.isNotEmpty) {
                  User newUser = User(
                    id: '',
                    name: nameController.text,
                    email: emailController.text,
                  );
                  await ApiService().addUser(newUser);
                  Navigator.pop(context);
                  setState(() {
                    users = ApiService().getAllUser();
                  });
                }
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Future<void> showEditUserDialog(BuildContext context, User user) async {
    TextEditingController nameController = TextEditingController(text: user.name);
    TextEditingController emailController = TextEditingController(text: user.email);

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit User'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () async {
                if (nameController.text.isNotEmpty && emailController.text.isNotEmpty) {
                  User updatedUser = User(
                    id: user.id,
                    name: nameController.text,
                    email: emailController.text,
                  );

                  User? editedUser = await ApiService().editUser(user.id, updatedUser);
                  if (editedUser != null) {
                    setState(() {
                      users = ApiService().getAllUser();
                    });
                    Navigator.pop(context);
                  }
                }
              },
              child: Text('Update'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
