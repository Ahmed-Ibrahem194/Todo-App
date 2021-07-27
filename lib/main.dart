import 'package:ahmed/layout/home_layout.dart';
import 'package:ahmed/modules/BMI%20Screen/bmi+screen.dart';
import 'package:ahmed/modules/bmi_result/bmi_result_screen.dart';
import 'package:ahmed/modules/home/home_screen.dart';
import 'package:ahmed/modules/login/login_screen.dart';
import 'package:ahmed/modules/users/users_screen.dart';
import 'package:flutter/material.dart';

import 'modules/counter/counter_screen.dart';
import 'modules/messenger/messenger_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomeLayout(),


    );
  }

}