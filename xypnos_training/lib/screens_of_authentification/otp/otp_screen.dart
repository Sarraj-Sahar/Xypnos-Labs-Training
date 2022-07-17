import 'package:flutter/material.dart';
import 'package:xypnos_training/size_config.dart';

import 'package:xypnos_training/screens_of_authentification/otp/components/body.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
      ),
      body: Body(),
    );
  }
}
