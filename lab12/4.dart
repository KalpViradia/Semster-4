import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(Lab12_4());
}

class Lab12_4 extends StatefulWidget {
  @override
  State<Lab12_4> createState() => _Lab12_4State();
}

class _Lab12_4State extends State<Lab12_4> {
  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Date Picker Demo"),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Selected Date: $formattedDate',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                DateTime picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                ) ??
                    selectedDate;

                if (picked != null && picked != selectedDate) {
                  setState(() {
                    selectedDate = picked;
                  });
                }
              },
              child: Text('Select Date'),
            )
          ]),
        ),
      ),
    );
  }
}
