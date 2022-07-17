import 'package:flutter/material.dart';
import 'package:xypnos_training/components/custom_surfix_icon.dart';
import 'package:xypnos_training/components/default_button.dart';
import 'package:xypnos_training/components/form_error.dart';
import 'package:xypnos_training/screens_of_authentification//otp/otp_screen.dart';
import 'package:xypnos_training/Strings/Sign_in_Sign_up_strings.dart';

import 'package:xypnos_training/constants.dart';
import 'package:xypnos_training/size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firstName;
  String lastName;
  String phoneNumber;
  String address;

  TextEditingController passController = TextEditingController();
  TextEditingController repassController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  _register() async {
    var data = {
      'name': nameController.text,
      'email': emailController.text,
      'password': passController.text,
    };
    debugPrint(nameController.text);
    debugPrint(emailController.text);
    debugPrint(passController.text);
    debugPrint(repassController.text);
  }

  //building Error on the screen
  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  //Removing Error From Screen
  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  // This is the View
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: Strings.sign_now,
            press: () {
              _register();
            },
            // OTP SCREEN
            // press: () {
            //   if (_formKey.currentState.validate()) {
            //     Navigator.pushNamed(context, OtpScreen.routeName);
            //   }
            // },
          ),
        ],
      ),
    );
  }

  //building The input of the adress

  TextFormField buildAddressFormField() {
    return TextFormField(
      style: TextStyle(color: kPrimaryColor),
      keyboardType: TextInputType.visiblePassword,
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: Strings.Enter_your_home_adress_label,
        hintText: Strings.Enter_your_home_adress,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  //building The input of the Phone number

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
      decoration: InputDecoration(
        labelText: Strings.Enter_your_phone_number_label,
        hintText: Strings.Enter_your_phone_number,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  //building The input of the Last Name

  TextFormField buildLastNameFormField() {
    return TextFormField(
      style: TextStyle(color: kPrimaryColor),
      keyboardType: TextInputType.visiblePassword,
      onSaved: (newValue) => lastName = newValue,
      decoration: InputDecoration(
        labelText: Strings.Enter_your_last_name_label,
        hintText: Strings.Enter_your_last_name,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  //building The input of the First Name

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      style: TextStyle(color: kPrimaryColor),
      keyboardType: TextInputType.visiblePassword,
      onSaved: (newValue) => firstName = newValue,
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
}
