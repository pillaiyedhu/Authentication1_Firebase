import 'package:auth1_try/screens/SignUpPage.dart';
import 'package:auth1_try/widgets/LoginFormWidget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: Text('Login Page'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),  
      body: Center(
        child: Column(
          children: [
            LoginFormWidget(),
            const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Dont Have an Account'),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpPage(),
                            ));
                      },
                      child: const Text("Sign Up"))
                ],
              )
            ],

        ),
      )
    );
  }
}