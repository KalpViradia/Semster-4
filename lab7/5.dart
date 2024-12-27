import 'package:flutter/material.dart';

class Lab7_5 extends StatefulWidget {
  Lab7_5({super.key});

  @override
  _Lab7_5State createState() => _Lab7_5State();
}

class _Lab7_5State extends State<Lab7_5> {
  TextEditingController textController = TextEditingController();
  String _displayText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TextField to Text Widget')),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                labelText: 'Enter something',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _displayText = textController.text;
                });
              },
              child: Text('Show Text'),
            ),
            SizedBox(height: 20),
            Text(
              _displayText,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
