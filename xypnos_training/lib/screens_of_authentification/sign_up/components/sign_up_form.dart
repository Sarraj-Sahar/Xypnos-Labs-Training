import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xypnos_training/Strings/Sign_in_Sign_up_strings.dart';
import 'package:xypnos_training/api/services_2/remote_services.dart';
import 'package:xypnos_training/components/custom_surfix_icon.dart';
import 'package:xypnos_training/components/default_button.dart';
import 'package:xypnos_training/components/form_error.dart';
import 'package:xypnos_training/screens_of_authentification/complete_profile/complete_profile_screen.dart';

import 'package:xypnos_training/constants.dart';
import 'package:xypnos_training/screens_of_authentification/sign_in/sign_in_screen.dart';
import 'package:xypnos_training/size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController passController = TextEditingController();
  TextEditingController repassController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phonenumController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String email;
  String password;
  String conform_password;
  String Name;
  String phoneNumber;

  bool remember = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  _register() async {
    var data = {
      'name': nameController.text,
      'email': emailController.text,
      'password': passController.text,
      'phone_number': phonenumController.text,
      'password_confirmation': repassController.text,
    };
    debugPrint(nameController.text);
    debugPrint(emailController.text);
    debugPrint(passController.text);
    debugPrint(repassController.text);

    var res = await RemoteServices.postData(data, 'register');
    var body = json.decode(res.body);
    print(body);
    if (res.statusCode == 201) {
      //SharedPreferences localStorage = await SharedPreferences.getInstance();
      // localStorage.setString('token', body['token']);
      //localStorage.setString('user', json.encode(body['user']));

      Navigator.pushNamed(context, SignInScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNameFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildConformPassFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
              text: Strings.sign_now,
              // text: Strings.verification_Button_continue,
              // press: () {
              //   if (_formKey.currentState.validate()) {
              //     _formKey.currentState.save();
              //     // if all are valid then go to success screen
              //     Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              //   }
              // },
              //
              press: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  // if all are valid then go to success screen
                  _register();
                }
              }),
        ],
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      style: TextStyle(color: kPrimaryColor),
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      controller: phonenumController,
      decoration: InputDecoration(
        labelText: Strings.Enter_your_phone_number_label,
        hintText: Strings.Enter_your_phone_number,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      style: TextStyle(color: kPrimaryColor),
      keyboardType: TextInputType.visiblePassword,
      onSaved: (newValue) => Name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      controller: nameController,
      decoration: InputDecoration(
        labelText: Strings.Enter_your_first_name_label,
        hintText: Strings.Enter_your_first_name,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      style: TextStyle(color: kPrimaryColor),
      obscureText: true,
      onSaved: (newValue) => conform_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == conform_password) {
          removeError(error: kMatchPassError);
        }
        conform_password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      controller: repassController,
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      style: TextStyle(color: kPrimaryColor),
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      controller: passController,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      style: TextStyle(color: kPrimaryColor),
      keyboardType: TextInputType.visiblePassword,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      controller: emailController,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
