import 'package:flutter/material.dart';
import 'database_helper.dart';

void main() {
  runApp(Userlist());
}

class Userlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserlistScreenwork(),
    );
  }
}

class UserlistScreenwork extends StatefulWidget {
  @override
  State<UserlistScreenwork> createState() => _UserlistScreenworkState();
}

class _UserlistScreenworkState extends State<UserlistScreenwork> {
  List<Map<String, dynamic>> users = [];

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    final data = await DatabaseHelper.instance.getUsers();
    setState(() => users = data);
  }

  void _showUserDialog({int? id}) {
    TextEditingController namedatacontroller = TextEditingController();
    TextEditingController agedatacontroller = TextEditingController();
    TextEditingController citydatacontroller = TextEditingController();

    if (id != null) {
      final user = users.firstWhere((u) => u['id'] == id);
      namedatacontroller.text = user['name'];
      agedatacontroller.text = user['age'];
      citydatacontroller.text = user['city'];
    }

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(id == null ? 'add' : 'edit'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                    controller: namedatacontroller,
                    decoration: InputDecoration(labelText: "Name")),
                TextField(
                    controller: agedatacontroller,
                    decoration: InputDecoration(labelText: "age"),
                    keyboardType: TextInputType.number),
                TextField(
                    controller: citydatacontroller,
                    decoration: InputDecoration(labelText: "city")),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel')),
              ElevatedButton(
                  onPressed: () async {
                    String name = namedatacontroller.text;
                    String age = agedatacontroller.text;
                    String city = citydatacontroller.text;

                    if (name.isNotEmpty && age.isNotEmpty && city.isNotEmpty) {
                      if (id == null) {
                        await DatabaseHelper.instance
                            .addUser({'name': name, 'age': age, 'city': city});
                      } else {
                        await DatabaseHelper.instance.updateUser({'id': id, 'name': name, 'age': age, 'city': city});
                      }
                      _loadUsers();
                      Navigator.pop(context);
                    }
                  },
                  child: Text(id == null ? 'add' : 'update'))
            ],
          );
        });
  }

  void _deleteUser(int id) async{
    showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('Confirm Delete'),
            content: Text('Are you sure you want to delete userdata'),
            actions: [
              TextButton(child: Text('Cancel'),onPressed: () => Navigator.of(context).pop(),),
              TextButton(child: Text('delete',style: TextStyle(color: Colors.red),),onPressed: () async {
                await DatabaseHelper.instance.deleteUser(id);
                _loadUsers();
                Navigator.pop(context);
              },),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: users.isEmpty
          ? Center(
        child: Text('No user added'),
      )
          : ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(users[index]['name']),
            subtitle: Text(
                'Age: ${users[index]['age']}, City: ${users[index]['city']}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.blue,
                  ),
                  onPressed: () => _showUserDialog(id: users[index]['id']),
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () => _deleteUser(users[index]['id']),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.green,),
        onPressed: () => _showUserDialog(),
      ),
    );
  }
}