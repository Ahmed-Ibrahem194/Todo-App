import 'dart:ui';

import 'package:ahmed/models/user/users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class UserScreen extends StatelessWidget {
  List<UserModel> users =
  [
    UserModel(id: 1, name: "Ahmed Elqaneshy", number: 01152485352),
    UserModel(id: 2, name: "Eman Elqaneshy", number: 01155555552),
    UserModel(id: 3, name: "Ibrahem Elqaneshy", number: 0118989892),
    UserModel(id: 4, name: "hnan Elqaneshy", number: 01152485352),
    UserModel(id: 5, name: "farida Elqaneshy", number: 06868686352),
    UserModel(id: 6, name: "7la Elqaneshy", number: 01154242352),
    UserModel(id: 7, name: "mai Elqaneshy", number: 011524242),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Users"),
      ),

      body:
      ListView.separated
        (
          itemBuilder:(context,index) => buildUsersItem(users[index])
          , separatorBuilder: (context,index)=> Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20.0,
              end: 20.0,
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          )
          , itemCount: users.length),
      // Padding(
      //   padding: const EdgeInsets.all(20.0),
      //   child: Row(
      //          children:
      //          [
      //            CircleAvatar(
      //              radius: 25.0,
      //              child:Text("1",
      //              style:TextStyle(
      //                fontSize: 25.0,
      //                fontWeight: FontWeight.bold,
      //              ),
      //              ),
      //            ),
      //            SizedBox(width: 20.0,),
      //            Column(
      //              mainAxisSize:MainAxisSize.min,
      //              mainAxisAlignment: MainAxisAlignment.start,
      //              children:
      //              [
      //                Text("Ahmed Elqaneshy",
      //                  style:TextStyle(
      //                    fontSize: 25.0,
      //                    fontWeight: FontWeight.bold,
      //                  ),
      //                ),
      //
      //                Text("01152485352",
      //                  style:TextStyle(
      //                    color: Colors.grey,
      //                  ),
      //                ),
      //
      //              ],
      //            ),
      //
      //          ],
      //   ),
      // ),


    );
  }
  Widget buildUsersItem(UserModel user) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children:
      [
        CircleAvatar(
          radius: 25.0,
          child:Text(
            "${user.id}",
            style:TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 20.0,),
        Column(
          mainAxisSize:MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children:
          [
            Text(
              "${user.name}",
              style:TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text("${user.number}",
              style:TextStyle(
                color: Colors.grey,
              ),
            ),

          ],
        ),

      ],
    ),
  );


}
