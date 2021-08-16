import 'package:ahmed/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';

Widget defultButton({
   double width = double.infinity,
   Color background = Colors.blue,
  required Function? function ,
  required String text ,
}) =>
    Container(
  width: width,
  color: background,

  child: MaterialButton(
    onPressed:(){function;},

    child : Text(
      text.toUpperCase(),
      style: TextStyle(
        color:Colors.white,
      ),
    ),
  ),
);

 Widget defultFormField({
   required TextEditingController? controller ,
   required TextInputType type ,
   Function? onSubmit,
   Function? onChange,
   required  Function? validate,
   required String labelText ,
   required IconData prefix,
   IconData? suffix,
   bool isPassword = false,
   Function? suffixPressud,
   Function? onTap ,


 }) {
   return TextFormField(
          controller:controller,
          keyboardType: type,
          obscureText: isPassword,
          onFieldSubmitted:(s){onSubmit;} ,
          onChanged:(s){onChange;} ,
          onTap:(){onTap;} ,
          decoration: InputDecoration(
                      prefixIcon: Icon(prefix),
                      suffixIcon: IconButton(onPressed: (){suffixPressud;},
                          icon: Icon(suffix)),
                      labelText: labelText,
                      border: OutlineInputBorder(),
                                ),
                        validator:(s) {validate;},
                                );
 }

Widget buildTaskItem(Map model , context)=>  Dismissible(
  
  key: Key(model["id"].toString()),
  child:Padding(
  
    padding: const EdgeInsets.all(15.0),
  
    child: Row(
  
      children: [
  
        CircleAvatar(
  
          radius: 40.0,
  
          child: Text(
  
            "${model["time"]}",
  
          ),
  
        ),
  
        SizedBox(
  
          width: 20.0,
  
        ),
  
        Expanded(
  
          child: Column(
  
            mainAxisSize: MainAxisSize.min,
  
            children: [
  
              Text(
  
                "${model["title"]}",
  
                style: TextStyle(
  
                  color: Colors.black,
  
                  fontSize: 16.0,
  
                  fontWeight: FontWeight.bold,
  
                ),
  
              ),
  
              Text(
  
                "${model["date"]}",
  
                style: TextStyle(
  
                  color: Colors.grey,
  
                ),
  
              ),
  
            ],
  
          ),
  
        ),
  
        SizedBox(
  
          width: 20.0,
  
        ),
  
        IconButton(
  
          icon:Icon(
  
            Icons.check_box,
  
            color: Colors.green,
  
          ), onPressed: () {
  
          AppCubit.get(context).updateDatabase(status: "done", id: model["id"]);
  
  
  
        },
  
        ),
  
        IconButton(
  
          icon:Icon(
  
            Icons.archive,
  
            color: Colors.black45,
  
  
  
          ), onPressed: () {
  
            AppCubit.get(context).updateDatabase(status: "archive", id: model["id"]);
  
        },
  
        ),
  
      ],
  
    ),
  
  ),
  onDismissed: (direction)
  {
    AppCubit.get(context).deleteDatabase(id: model["id"]);
  },
);
