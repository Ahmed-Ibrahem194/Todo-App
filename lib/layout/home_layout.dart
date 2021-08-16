
import 'package:ahmed/shared/cubit/cubit.dart';
import 'package:ahmed/shared/cubit/states.dart';
import 'package:conditional_builder/conditional_builder.dart' show ConditionalBuilder;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeLayout extends StatelessWidget {


  bool isClickable = true;

  var titlecontroller = TextEditingController();
  var timecontroller = TextEditingController();
  var datecontroller = TextEditingController();
  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {


    return BlocProvider(
        create: (BuildContext context) => AppCubit(),
        child:
        BlocConsumer<AppCubit, AppStates> (
        listener: (context , state){
          if(state is AppInsertDatabaseState)
            {
              Navigator.pop(context);
            }
        },
        builder:(context , state){

          return Scaffold(
          key:scaffoldkey ,
          appBar: AppBar(
            leading: Icon(Icons.menu,),
            title: Text(
              AppCubit.get(context).titles[AppCubit.get(context).currentIndex],
            ),
          ),
          body:  ConditionalBuilder(
            condition: true,
            builder:(context) => AppCubit.get(context).screens[AppCubit.get(context).currentIndex],
            fallback: (context) => Center(child: CircularProgressIndicator()),

          ),

          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (AppCubit.get(context).isBottomSheetShown)
              {
                if (formkey.currentState!.validate())
                {
                 AppCubit.get(context).insertToDataBase(
                     date:datecontroller.text,
                     time: timecontroller.text ,
                     title: titlecontroller.text );
                    // title: titlecontroller.text,
                    // time: timecontroller.text,
                    // date: datecontroller.text,
                  // ).then((value)
                  // {
                  //   AppCubit.get(context).getDataFromDataBase(AppCubit.get(context).database).then((value){
                  //     AppCubit.get(context). tasks = value;
                  //   });
                  //   Navigator.pop(context);
                  //   AppCubit.get(context).isBottomSheetShown;
                  // });
                }
              } else {
                scaffoldkey.currentState!.showBottomSheet(
                      (context) =>
                      Container(
                        color: Colors.grey[100],
                        padding: EdgeInsets.all(20.0),

                        child: Form(
                          key: formkey,

                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children:
                            [
                              //Title
                              TextFormField
                                (
                                controller: titlecontroller,
                                keyboardType: TextInputType.text,


                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Enter titlt";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.title),
                                  labelText: 'Task Title',
                                  border: OutlineInputBorder(),
                                ),
                              ),

                              SizedBox(height: 20.0,),

                              //time
                              TextFormField(
                                controller: timecontroller,
                                keyboardType: TextInputType.datetime,

                                onTap: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value) {
                                    timecontroller.text =
                                        value!.format(context).toString();
                                  });
                                },
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "time mustn't be empty";
                                  }
                                  return null;
                                },

                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.watch_later_outlined),
                                  labelText: 'Task Time',
                                  border: OutlineInputBorder(),
                                ),
                              ),

                              SizedBox(height: 20.0,),

                              //date
                              TextFormField(
                                controller: datecontroller,
                                keyboardType: TextInputType.datetime,
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse("2021-10-03"),
                                  ).then((value) {
                                    datecontroller.text =
                                        DateFormat.yMMMd().format(value!);
                                  });
                                },
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "date mustn't be empty";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.calendar_today),
                                  labelText: " task date",
                                  border: OutlineInputBorder(),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                ).closed.then((value) {
                  AppCubit.get(context).changeBottomSheetState(isShow: false, icon: Icons.edit);
                });

                AppCubit.get(context).changeBottomSheetState(isShow: true, icon: Icons.add);
              }
            },
            child: Icon(AppCubit.get(context).myIcone),
          ),

          bottomNavigationBar: BottomNavigationBar
            (
              type: BottomNavigationBarType.fixed,
              currentIndex:AppCubit.get(context).currentIndex,
              onTap: (index) {
                AppCubit.get(context).changeIndex(index);
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
        );}

      ),
    );
  }


}


