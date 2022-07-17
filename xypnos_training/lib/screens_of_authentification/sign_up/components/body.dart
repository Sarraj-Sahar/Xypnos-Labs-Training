import 'package:flutter/material.dart';
import 'package:xypnos_training/components/socal_card.dart';
import 'package:xypnos_training/constants.dart';
import 'package:xypnos_training/size_config.dart';
import 'package:xypnos_training/Strings/Sign_in_Sign_up_strings.dart';
import 'sign_up_form.dart';

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
                // SizedBox(height: SizeConfig.screenHeight * 0.01), // 4%
                Text(
                  Strings.Create_your_account,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).iconTheme.color,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.01), // 4%

                Text(
                  Strings.Creat_det_social,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blueGrey[400]),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  Strings.terms_conditions,
                  textAlign: TextAlign.center,
                  // style: Theme.of(context).textTheme.caption,
                  style: TextStyle(color: Colors.blueGrey[400]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
