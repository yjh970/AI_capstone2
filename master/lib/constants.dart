import 'package:final_project/size_config.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF07C620);
const kPrimaryLightColor = Color(0xFFACEF94);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF088B05), Color(0xFFA3EF41)],
);

const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
fontSize: getProportionateScreenWidth(28),
fontWeight: FontWeight.bold,
color: Colors.black,
height: 1.5);


final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNameNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kJobGroupNullError = "Please Enter your Job Group";
const String kPriceNullError = "Please Enter the price of the Meeting";
const String kImageNullError = "Please Enter a path for the Image";

