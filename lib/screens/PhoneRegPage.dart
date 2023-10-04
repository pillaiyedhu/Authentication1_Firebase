import 'package:flutter/material.dart';

class PhoneRegPage extends StatefulWidget {
  @override
  State<PhoneRegPage> createState() => PhoneRegPageState();
}

class PhoneRegPageState extends State<PhoneRegPage> {
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
            child: Column(
              children: [
                
              ]
            ),
          ),
        ));
  }
}
