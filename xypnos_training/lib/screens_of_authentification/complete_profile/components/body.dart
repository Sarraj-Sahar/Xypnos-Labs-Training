import 'package:flutter/material.dart';
import 'package:xypnos_training/Strings/Sign_in_Sign_up_strings.dart';
import 'package:xypnos_training/constants.dart';
import 'package:xypnos_training/size_config.dart';

import 'package:xypnos_training/screens_of_authentification/complete_profile/components/complete_profile_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Text(
                  "Complete Profile",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).iconTheme.color,
                    height: 1.5,
                  ),
                ),
                Text(
                  Strings.Creat_det_social,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blueGrey[400]),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                CompleteProfileForm(),
                SizedBox(height: getProportionateScreenHeight(30)),
                Text(
                  Strings.terms_conditions_sign_up,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
