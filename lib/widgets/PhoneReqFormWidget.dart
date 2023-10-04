import 'package:auth1_try/screens/Home.dart';
import 'package:auth1_try/screens/VerifyPhonePage.dart';
import 'package:auth1_try/utils/Util.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneReqFormWidget extends StatefulWidget {
  @override
  State<PhoneReqFormWidget> createState() => PhoneReqFormWidgetState();
}

class PhoneReqFormWidgetState extends State<PhoneReqFormWidget> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();

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
                hintText: '+91 111 222 3333',
              ),
              controller: phoneController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter your phoneNumber';
                } else {
                  return null;
                }
              },
            ),
            ElevatedButton(
                onPressed: () {
                  phone();
                },
                child: Text('Login'))
          ],
        ),
      ),
    );
  }

  Future phone() async {
    if (formKey.currentState!.validate()) {
      await auth
          .verifyPhoneNumber(
        phoneNumber: phoneController.text,
        verificationCompleted: (phoneAuthCredential) {},
        verificationFailed: (error) {
          Util().toastMessage(error.toString());
        },
        codeSent: (verificationId, forceResendingToken) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VerifyPhonePage(verificationId:verificationId),
              ));
        },
        codeAutoRetrievalTimeout: (verificationId) {
          Util().toastMessage(verificationId);
        },
      )
          .then((value) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ));
      }).onError((error, stackTrace) {
        Util().toastMessage(error.toString());
      });
    }
  }
}
