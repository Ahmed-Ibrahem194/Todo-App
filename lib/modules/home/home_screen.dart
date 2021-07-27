
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: Icon(Icons.menu,) ,
            title: Text(
              "First App",
            ),
        actions:
        [
          IconButton(icon:Icon (Icons.notification_important), onPressed: (){print("الاشعار وصل");},),

          IconButton(icon: Icon(Icons.search), onPressed:() {print("تم البحث");},),
        ],
      ),

      body: Column(
        children:
        [
         Stack(
           alignment: Alignment.bottomCenter,
            children: [
              Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSj22x9fCLI-9tTl_P5ZDexr0zHoftsz8tRpQ&usqp=CAU"),
                 height:300,
                width: 300,
                fit: BoxFit.cover,
              ),
              Container(
                padding: EdgeInsetsDirectional.only(
                  start: 10.0,
                  end: 10.0,
                ),
                child: Text(
                "Flower",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}