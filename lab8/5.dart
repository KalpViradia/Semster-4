import 'package:flutter/material.dart';
import 'dart:math';

class Lab8_5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DiceRollScreen(),
    );
  }
}

class DiceRollScreen extends StatefulWidget {
  @override
  _DiceRollScreenState createState() => _DiceRollScreenState();
}

class _DiceRollScreenState extends State<DiceRollScreen> {
  int diceNumber = 1;

  void rollDice() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    String diceImage = 'assets/images/dice$diceNumber.png';

    return Scaffold(
      appBar: AppBar(
        title: Text('Roll Dice App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(diceImage, width: 150, height: 150),
            SizedBox(height: 20),
            Text(
              'Roll Result: $diceNumber',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: rollDice,
              child: Text(
                'Roll Dice',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
