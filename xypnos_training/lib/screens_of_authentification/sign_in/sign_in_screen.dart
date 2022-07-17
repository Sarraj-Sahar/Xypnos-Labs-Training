import 'package:flutter/material.dart';
import 'package:xypnos_training/size_config.dart';
import 'package:xypnos_training/screens_of_authentification/sign_in/components/body.dart';

class SignInScreen extends StatelessWidget {
  // Move to page sign in.

  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Scaffold(
        // backgroundColor: Color(0xFF060a14),
        appBar: AppBar(
          elevation: 0,
          // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            "Sign In",
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1.color,
            ),
          ),
        ),
        body: Body(),
      ),
    );
  }
}
