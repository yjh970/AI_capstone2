import 'package:final_project/constants.dart';
import 'package:final_project/screens/forgot_password/forgot_password_screen.dart';
import 'package:final_project/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';


class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account? ",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(16),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
            child: Text(
              "Sign Up",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
