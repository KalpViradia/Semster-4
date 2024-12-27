import 'package:flutter/material.dart';

class Lab8_4 extends StatefulWidget {
  Lab8_4({super.key});

  @override
  _Lab8_4State createState() => _Lab8_4State();
}

class _Lab8_4State extends State<Lab8_4> {
  TextEditingController nameController = TextEditingController();
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Birthday Card'),
      ),
      body: Column(
        children: [
          Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Enter Your Name',
                  hintText: 'My Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    name = "Happy Birthday \n"
                        "${nameController.text}";
                  });
                },
                child: Text('Submit'),
              ),
              SizedBox(height: 20),
            ],
          ),
          Expanded(
            child: Container(
              child: Center(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset('assets/images/birthday_card_background.png'),
                    Center(
                      child: Text(
                        name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
