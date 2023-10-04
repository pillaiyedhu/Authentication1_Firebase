import 'package:flutter/material.dart';

class VerifyPhonePage extends StatefulWidget {
  final String verificationId;
  VerifyPhonePage({required this.verificationId});
  @override
  State<VerifyPhonePage> createState() => VerifyPhonePageState();
}

class VerifyPhonePageState extends State<VerifyPhonePage> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Phone Number Registration'),
          centerTitle: true,
          backgroundColor: Colors.cyan,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Center(
            child: Column(children: [
              
            ]),
          ),
        ));
  }
}
