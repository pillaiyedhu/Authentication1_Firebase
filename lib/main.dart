//import 'package:auth1_try/screens/LoginPage.dart';
import 'package:auth1_try/screens/SignUpPage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import '';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(options: const FirebaseOptions(
      apiKey: "AIzaSyDzCnL4TzzwEKSv7S-GA615RiZpnAfgD08", 
      appId: "1:10563656007:web:f75b50f568f46b2d00d462", 
      messagingSenderId: "10563656007", 
      projectId: "auth1-dac6a"
  ));
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(home: SignUpPage());
  }
}
