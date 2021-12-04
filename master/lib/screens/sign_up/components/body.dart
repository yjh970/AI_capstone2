
import 'package:final_project/components/social_card.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/screens/sign_up/components/signup_form.dart';
import 'package:final_project/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight* 0.02),
              Text(
                'Register Account',
                style: headingStyle,
              ),
              Text(
                "Complete your details or continue \nwith social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight* 0.07),
              SignUpForm(),
              SizedBox(height: SizeConfig.screenHeight* 0.07),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                    icon: 'assets/icons/google-icon.svg',
                    press: () {},
                  ),
                  SocialCard(
                    icon: 'assets/icons/facebook-2.svg',
                    press: () {},
                  ),
                  SocialCard(
                    icon: 'assets/icons/twitter.svg',
                    press: () {},
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(20),),
              Text("By continuing your confirm you agree \nwith our Terms and Conditions",
              textAlign: TextAlign.center,),
            ],
          ),
        ),
      ),
    );
  }
}

