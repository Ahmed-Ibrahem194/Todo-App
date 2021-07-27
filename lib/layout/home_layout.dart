import 'package:ahmed/modules/archived_task/archived_tasks_screen.dart';
import 'package:ahmed/modules/done_tasks/done_tasks_screen.dart';
import 'package:ahmed/modules/new_tasks/new_tasks_screen.dart';
import 'package:ahmed/shared/componant/componant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "package:sqflite/sqflite.dart";

class HomeLayout extends StatefulWidget {

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {

  IconData myIcone = Icons.edit;

  bool isBottomSheetShown= false ;

  late Database database ;

  int currentIndex = 0 ;

     var titlecontroller = TextEditingController() ;
     var timecontroller = TextEditingController() ;

  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();


  List<Widget> screens =
      [
        NewTasksScreen(),
        DoneTasksScreen(),
        ArchivedTasksScreen(),
      ];

  List<String> titles =
  [
    "New Tasks" ,
    "Done Tasks" ,
    "Archived Tasks" ,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        leading: Icon(Icons.menu,),
        title: Text(
          titles[currentIndex],
        ),
      ),
      body: screens[currentIndex],

      floatingActionButton: FloatingActionButton(
          onPressed: ()
          {
            if(isBottomSheetShown)
            {
              if(formkey.currentState!.validate()) {
                Navigator.pop(context);
                isBottomSheetShown = false;
                setState(() {
                  myIcone = Icons.edit;
                });
              }
            } else
              {
                scaffoldkey.currentState!.showBottomSheet(
                    (context) => Container(
                      color:  Colors.grey[100],
                        padding: EdgeInsets.all(20.0),

                      child: Form(
                        key: formkey,

                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children:
                          [
                            //Title
                            defultFormField
                              (
                              controller: titlecontroller,
                              type:TextInputType.text ,


                              validate:(String value)
                              {
                                if(value.isEmpty)
                                {
                                  return "Enter titlt" ;
                                }
                                return null ;
                              },
                              labelText: "Task Title",
                              prefix:Icons.title,
                            ),
                            SizedBox(height: 20.0,),


                            //Time
                            defultFormField
                              (
                              onTap: ()
                              {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value)
                                {
                                  timecontroller.text = value!.format(context).toString();
                                  print(value.format(context));
                                });
                              },
                              controller: timecontroller,
                              type:TextInputType.datetime ,
                              validate:(String value)
                              {
                                if(value.isEmpty)
                                {
                                  return "Enter Time" ;
                                }
                                return null ;
                              },
                              labelText: "Task Time",
                              prefix:Icons.watch_later_outlined ,
                            ),

                          ],
                        ),
                      ),
                    ),
              );
                isBottomSheetShown = true ;
                setState(() {
                  myIcone= Icons.add ;
                });
              }
          },
          child: Icon(myIcone),
    ),

      bottomNavigationBar: BottomNavigationBar
        (
        type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index)
          {
            setState(() {
              currentIndex = index;
            });
          },
              items:
               [
               BottomNavigationBarItem(
                   icon: Icon(
                     Icons.menu,
                   ),
                 label: "Tasks",

               ),
               BottomNavigationBarItem(
              icon: Icon(
                Icons.check_circle,
              ),
              label: "Done",

            ),
               BottomNavigationBarItem(
              icon: Icon(
                Icons.archive_outlined,
              ),
              label: "Archived",

            ),
               ]
      ),
    );
  }

  Future<String> getName() async
  {
    return ("Qaneshy");
  }

  void creatDatabase() async
  {
     database = await openDatabase(
        "todo.db",
        version: 1,

      onCreate: (database , version) async
         {
           print("dataBase created");
         await database.execute("CREAT TABLE tasks (id INTEGER , title TEXT , data TEXT , time TEXT , status TEXT) ");
           print("tabel created");

         },

      onOpen: (database)
      {
        print("dataBase opened");
      },
    );
  }

  void isertToDatabase()
  {
    database.transaction((txn)
    {
       return  txn.rawInsert(
          "INSERT INTO tasks (tiltle , date , time , status) VALUES(first , 19/4 , 4 , muslem")
          .then((value)
               {
                 print("$value successeded Inserting");
               }).catchError((error)
                    {
                      print("Error when Inserting ${error.toString()}");
                    });
                 });
  }
}
