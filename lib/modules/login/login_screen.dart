 import 'package:ahmed/shared/componant/componant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget
 {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   bool iisPassword = true;

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(),
       body:Padding(
           padding: const EdgeInsets.all(20.0),
            child: Form(
              key:formKey  ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  Text(
                      "Login",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight : FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40.0,),

                  defultFormField
                    (
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate:(value)
                          {
                            if (value.isEmpty)
                          {
                             return"email adress must not be empty";
                          }
                              return null ;
                          },
                      labelText: "Email Adress",
                      prefix: Icons.email),



                  SizedBox(height: 15.0,),

                  defultFormField
                    (
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      validate:(value)
                      {
                        if (value.isEmpty)
                        {
                          return"password adress must not be empty";
                        }
                        return null ;
                      },
                      labelText: "Password",
                      prefix: Icons.lock,
                      suffix: !iisPassword ? Icons.visibility :Icons.visibility_off,

                       isPassword: iisPassword,
                      suffixPressud: ()
                    {
                     setState(() {
                       iisPassword = !iisPassword ;
                     });
                    },
                      ),

                  SizedBox(height: 20.0,),


                  defultButton(
                      text: 'login',
                  function: ()
                  {
                    if(formKey.currentState!.validate()){
                   print(emailController.text);
                   print(passwordController.text);
                    }
                  },
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(
                          onPressed: (){},
                          child: Text("Register Now"),),
                    ],
                  ),

                ],
              ),
            ),
       )


     );
   }
}
 