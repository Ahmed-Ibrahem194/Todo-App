import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState()
  {
    return _CounterScreenState();
  }
}

class _CounterScreenState extends State<CounterScreen> {
  int number = 0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Counter",),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            TextButton(onPressed: ()
               {
                setState(()
                {
                  number--;
                  print(number);
                });
               },
                child:Text("Minus",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900,
                ),),
            ) ,

            SizedBox(width: 15.0,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text("${number}",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900,

                ),
              ),
            ),

            SizedBox(width: 15.0,),


            TextButton(onPressed: ()
              {
                 setState(()
                 {
                   number++;
                   print(number);
                 });
              },
              child:Text("plus",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900,
                ),),
            ) ,

          ],
        ),
      ),
    );
  }
}
