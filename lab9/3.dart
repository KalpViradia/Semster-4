import 'package:flutter/material.dart';

void main() {
  runApp(Lab9_3());
}

class Lab9_3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ActionBarPage(),
    );
  }
}

class ActionBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Action Bar Example'),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Alert Dialog'),
                    content: Text('You clicked on the menu item!'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Ok'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Tap the menu in the action bar to show a dialog.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
