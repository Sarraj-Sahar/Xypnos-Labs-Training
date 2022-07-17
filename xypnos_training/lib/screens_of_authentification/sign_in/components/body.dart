import 'package:flutter/material.dart';
import 'package:xypnos_training/components/no_account_text.dart';
import 'package:xypnos_training/components/socal_card.dart';
import 'package:xypnos_training/size_config.dart';
import 'package:xypnos_training/constants.dart';
import 'package:xypnos_training/screens_of_authentification/sign_in/components/sign_form.dart';
import 'package:xypnos_training/screens_of_authentification/authentification.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Stack(children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  Text(
                    "Welcome Back !",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).iconTheme.color,
                      height: 1.5,
                    ),
                  ),
                  Text(
                    "Sign in with your account",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),

                  SignForm(),
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  // SizedBox(
                  //     height: ((MediaQuery.of(context).size.height) *
                  //         (0.04 / 812.0))),
                  Text(
                    "Or Sign in with social account",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  SizedBox(
                      height: ((MediaQuery.of(context).size.height) *
                          (0.04 / 812.0))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocalCard(
                        icon: "assets/icons/google-icon.svg",
                        press: () {
                          print('Google sign in ...');
                        },
                      ),
                      SocalCard(
                        icon: "assets/icons/facebook-2.svg",
                        press: () {
                          print('Facebook sign in ...');
                        },
                      ),
                    ],
                  ),

                  ////////////////////////////
                  SizedBox(height: getProportionateScreenHeight(40)),

                  NoAccountText(),
                ],
              ),
            ),
          ),
          // Positioned(child: _buildGradientOverlay())
        ]),
      ),
    );
  }
}
