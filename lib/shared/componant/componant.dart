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

         decoration: InputDecoration
                               (
                      prefixIcon: Icon(prefix),

                      suffixIcon: IconButton(
                          onPressed: (){suffixPressud;},
                          icon: Icon(suffix)
                      ),

                      labelText: labelText,
                      border: OutlineInputBorder(),
                                ),
                        validator:(s) {validate;},
                                );
 }