import 'package:auth1_try/screens/Home.dart';
import 'package:auth1_try/utils/Util.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginFormWidget extends StatefulWidget {
  @override
  State<LoginFormWidget> createState() => LoginFormWidgetState();
}

class LoginFormWidgetState extends State<LoginFormWidget> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
              controller: emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter your mail';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
              controller: passwordController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter your password';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  login();
                },
                child: Text('Login'))
          ],
        ),
      ),
    );
  }

  Future login() async {
    if (formKey.currentState!.validate()) {
      await auth
          .signInWithEmailAndPassword(
              email: emailController.text.toString(),
              password: passwordController.text.toString())
          .then((value) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context)=> Home(),
            ));
      }).onError((error, stackTrace) {
        Util().toastMessage(error.toString());
      });
    }
  }
}
