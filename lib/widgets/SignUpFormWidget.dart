import 'package:auth1_try/utils/Util.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpFormWidget extends StatefulWidget {
  @override
  State<SignUpFormWidget> createState() => SignUpFormWidgetState();
}

class SignUpFormWidgetState extends State<SignUpFormWidget> {
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
                  signUp();
                },
                child: Text('Login'))
          ],
        ),
      ),
    );
  }

  Future signUp() async {
    if (formKey.currentState!.validate()) {
      await auth
          .createUserWithEmailAndPassword(
              email: emailController.text.toString(),
              password: passwordController.text.toString())
          .then((value) {})
          .onError((error, stackTrace) {
        Util().toastMessage(error.toString());
      });
    }
  }
}
