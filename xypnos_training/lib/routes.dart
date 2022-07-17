import 'package:flutter/widgets.dart';
import 'package:xypnos_training/Screens/mainScreen.dart';
import 'package:xypnos_training/Splash_Screen/constellations_demo.dart';
import 'package:xypnos_training/screens_of_authentification//complete_profile/complete_profile_screen.dart';
import 'package:xypnos_training/screens_of_authentification//forgot_password/forgot_password_screen.dart';
import 'package:xypnos_training/screens_of_authentification//otp/otp_screen.dart';
import 'package:xypnos_training/screens_of_authentification//sign_in/sign_in_screen.dart';
import 'package:xypnos_training/screens_of_authentification/old_Splash/splash_screen.dart';
import 'screens_of_authentification//sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  ConstellationsListDemo.routeName: (context) => ConstellationsListDemo(),
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  MainScreen.routeName: (context) => MainScreen(),
};
