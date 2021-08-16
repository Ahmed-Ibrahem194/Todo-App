

import 'package:ahmed/modules/archived_task/archived_tasks_screen.dart';
import 'package:ahmed/modules/done_tasks/done_tasks_screen.dart';
import 'package:ahmed/modules/new_tasks/new_tasks_screen.dart';
import 'package:ahmed/shared/componant/conesstance.dart';
import 'package:ahmed/shared/cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>
{
  IconData myIcone = Icons.edit;
  bool isBottomSheetShown = false;
  List<Map> tasks = [] ;
  late Database database;

  int currentIndex = 0;

  List<Widget> screens =
  [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];

  List<String> titles =
  [
    "New Tasks",
    "Done Tasks",
    "Archived Tasks",
  ];
  void changeIndex(int index)
  {
    currentIndex = index;
    emit(AppChangeBottomNavigationBarState());
  }

  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context) ;


  void creatDatabase()
  {
    database =  openDatabase(
      "todo.db",
      version: 1,
      onCreate: (database, version)
      {
         database.execute(
            "CREATE TABLE tasks (id INTEGER PRIMARY KEY , title TEXT , time TEXT ,date TEXT ,  status TEXT)");
      },

      onOpen: (database)
      {
        getDataFromDataBase(database).then((value)
        {
          tasks = value;
          emit(AppGetDatabaseState());
        });
        print("dataBase opened");
      },
    ).then((value) {
      database = value;
      emit(AppCreatDatabaseState());
    }) as Database;
  }

   insertToDataBase({
    required String title ,
    required String time ,
    required String date,
  }) async
  {
    await database.transaction((txn)
    {
      return txn.rawInsert(
          "INSERT INTO tasks (title, time, date, status) VALUES($title , $time , $date , new)")

          .then((value) {
        getDataFromDataBase(database).then((value)
        {
          tasks = value;
          emit(AppGetDatabaseState());
        });

        print("$value inserted succeed");
          emit(AppInsertDatabaseState());})

          .catchError((error) {print("error when inserted ${error.toString()}");
      });
    });
  }

  Future <List<Map>>  getDataFromDataBase(database) async
  {
    emit(AppGetDatabaseState());
    return  await database.rawQuery("SELECT * FROM tasks");
  }

  void changeBottomSheetState({
    required bool isShow,
    required IconData icon,
  })
  {
   isBottomSheetShown = isShow;
   myIcone = icon;
   emit(AppEditBottomSheetState());
  }

    void updateDatabase({
      required String status,
      required int id,
        }) async
      {
       database.rawUpdate(
        'UPDATE tasks SET status = ?,WHERE id = ?',
        ['$status', id]
      ).then((value) {
         emit(AppUpdateDatabaseStates());
       });
       }
       
        deleteDatabase({required int id,})
       async { 
                 database.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value)
                 {
                   getDataFromDataBase(database).then((value)
                 {
                   tasks = value;
                   emit(AppDeleteDatabaseStates());
                 });
                 });
         
       }



}