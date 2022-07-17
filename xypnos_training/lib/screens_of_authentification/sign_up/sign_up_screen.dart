import 'package:flutter/material.dart';
import 'package:xypnos_training/Strings/Sign_in_Sign_up_strings.dart';
import 'package:xypnos_training/screens_of_authentification/sign_up/components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.sign_now,
        ),
      ),
      body: Body(),
    );
  }
}
