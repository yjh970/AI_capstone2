import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/components/default_button.dart';
import 'package:final_project/screens/home/home_screen.dart';
import 'package:final_project/screens/loading/loading_screen_home.dart';
import 'package:final_project/screens/sign_in/sign_in_screen.dart';
import 'package:final_project/services/auth.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final AuthService _auth = AuthService();
  String specification = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4,
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Accounts')
              .doc(_auth.getCurrentUser())
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return new CircularProgressIndicator();
            }
            Widget renderedText;
            var document = snapshot.data;
            print(document!['specification']);
            specification = document['specification'];
            if (specification == "Senior") {
              renderedText = Text(
                'Logged In as a \nSenior User',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(30),
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              );
            } else {
              renderedText = Text(
                'Logged in as a \nJunior User',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(30),
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              );
            }
            return renderedText;
          },
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Back to home",
            press: () => Navigator.pushNamed(context, LoadingScreenHome.routeName),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
