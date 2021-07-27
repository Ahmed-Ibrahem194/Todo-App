import 'dart:math';
import 'dart:ui';

import 'package:ahmed/modules/bmi_result/bmi_result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class BmiScreen extends StatefulWidget {
  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {

   double height = 120.0;

    bool isMale = true;
    int age = 15;
   int weight = 40;


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator"
        ),
      ),
      body: Column(
        children:
        [
          Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children:
                      [
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                isMale=true;
                                         });
                                         },
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:
                                [
                                 Image(image: AssetImage('images/4311875.png'),
                                 height: 90.0,
                                 width: 90.0,
                                 ),
                                  SizedBox(height: 15.0,),
                                  Text("Male",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(10.0,),

                                color:isMale? Colors.blue : Colors.grey[400],
                              ),
                            ),
                          ),
                            ),
                        SizedBox(width: 20.0,),
                        Expanded(
                          child: GestureDetector(
                            onTap: ()
                            {
                              setState(() {
                                isMale = false ;
                              });
                            },
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:
                                [
                                Image(image: AssetImage('images/femal.png'),
                                   height: 90.0,
                                  width: 90.0, ),

                                  SizedBox(height: 15.0,),
                                  Text("Female",
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                    ),),

                                ],
                              ),
                              decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(10.0),

                                color:!isMale? Colors.blue : Colors.grey[400],

                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

         ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    Text("HEIGHT",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children:
                      [
                        Text("${height.round()}",
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(width: 5.0,),

                        Text("cm",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],),
                    Slider(
                      value:height ,
                      max: 220.0,
                      min: 80.0,
                      onChanged:(value)
                      {
                        setState(() {
                          height = value;
                        });
                      } ,),


                  ],
                ),
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children:
                [
                  Expanded(
                    child: Container(
                               decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10.0),
                               color: Colors.grey,),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("AGE",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("${age}",
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children:
                            [
                              FloatingActionButton(
                                  onPressed: ()
                                  {
                                    setState(() {
                                      age-- ;
                                    });
                                  },
                                heroTag: "Age--",
                                  child:Icon(Icons.remove),
                                mini: true,
                              ),
                              FloatingActionButton(
                                onPressed: ()
                                {
                                  setState(() {
                                    age++ ;
                                  });
                                },
                                heroTag: "Age++",
                                child:Icon(Icons.add),
                                mini: true,
                              ),

                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey,),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Weight",
                            style :TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("${weight}",
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                            [
                              FloatingActionButton( onPressed: ()
                              {
                                setState(() {
                                  weight-- ;
                                });
                              },
                                heroTag: "weight--",
                                child:Icon(Icons.remove),
                                mini: true,
                              ),
                              FloatingActionButton(
                                onPressed: ()
                                {
                                  setState(() {
                                    weight++ ;
                                  });
                                },
                                heroTag: "weight++",
                                child:Icon(Icons.add),
                                mini: true,
                              ),

                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ],

              ),
            ),
          ),

          Container(
            width: double.infinity,
            color: Colors.blue,            height: 60.0,
            child:
            MaterialButton(
                onPressed: ()
                {
                 double Result = weight / pow(height/ 100 ,2);
                 print(Result.round());

                 Navigator.push(context, MaterialPageRoute(builder:(context) => BmiResultScreen(
                   result: Result,
                   age: age,
                   isMale: isMale,
                 ),
                 ),
                 );
                },
                child:Text(
                  "Calculate",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
                ),
            ),
          ),


        ],

      ),
    );
  }
}
