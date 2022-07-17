import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xypnos_training/Screens/mainScreen.dart';
import 'package:xypnos_training/api/services_2/remote_services.dart';
import 'package:xypnos_training/components/custom_surfix_icon.dart';
import 'package:xypnos_training/components/form_error.dart';
import 'package:xypnos_training/screens_of_authentification/forgot_password/forgot_password_screen.dart';
import 'package:xypnos_training/components/default_button.dart';
import 'package:xypnos_training/constants.dart';
import 'package:xypnos_training/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email; // Email declaration
  String password; // password declaration
  bool remember = false;
  TextEditingController textController = TextEditingController();
  TextEditingController emailController = TextEditingController();

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

  _login() async {
    var data = {
      'email': emailController.text,
      'password': textController.text,
    };

    var res = await RemoteServices.postData(data, 'login');
    var body = json.decode(res.body);
    print(body);
    if (res.statusCode == 201) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', body['token']);
      //
      await storage.write(key: "token", value: body['token']);
      localStorage.setString('user', json.encode(body['user']));
      Navigator.pushReplacementNamed(context, MainScreen.routeName);
      // print(localStorage.setString('user', json.encode(body['user'])));
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => MainScreen(),
      //     ),
      //     (route) => false);
    } else {
      _showMsg(body['message']);
    }
  }

  _showMsg(msg) {
    //
    final snackBar = SnackBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      content: Text(
        msg,
        style: TextStyle(
          color: Theme.of(context).iconTheme.color,
        ),
      ),
      action: SnackBarAction(
        label: 'Close',
        // textColor: Color(0xFF684789),
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  final storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                _login();

                // if all are valid then go to success screen
                // KeyboardUtil.hideKeyboard(context);
                // Navigator.pushReplacementNamed(context, MainScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      style: TextStyle(
        color: kPrimaryColor,
      ),
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
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
      controller: textController,
      decoration: InputDecoration(
        errorBorder: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        disabledBorder: outlineInputBorder(),
        focusedErrorBorder: outlineInputBorder(),
        border: outlineInputBorder(),
        labelText: "Password",
        // package:flutter/src/painting/text_style.dart
        // labelStyle: TextStyle(),
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  FocusNode _focusNode;
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      onTap: _requestFocus,
      focusNode: _focusNode,
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
      autocorrect: false,
      enableSuggestions: false,
      style: TextStyle(
        color: kPrimaryColor,
      ),
      decoration: InputDecoration(
        labelText: "Email",
        labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
        border: UnderlineInputBorder(),
        errorBorder: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        disabledBorder: outlineInputBorder(),
        focusedErrorBorder: outlineInputBorder(),
        // border: outlineInputBorder(),
        // labelStyle: TextStyle(),
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
