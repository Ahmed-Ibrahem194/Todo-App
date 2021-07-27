import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BmiResultScreen extends StatelessWidget {
  final bool isMale;
  final double result;
  final int age;

  BmiResultScreen({
    required this.isMale ,
  required this.result ,
  required this.age,
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Result",),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
           Text("Gender : $isMale",
           style: TextStyle(
             fontSize: 25.0,
             fontWeight: FontWeight.bold,
           ),),

            Text("Result : $result",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),),

            Text("Age : $age ",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),),
          ],
        ),
      ),
    );
  }
}
