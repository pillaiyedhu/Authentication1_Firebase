import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        color: Colors.black,
      ),
    );
  }
}