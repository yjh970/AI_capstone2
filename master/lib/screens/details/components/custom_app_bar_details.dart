import 'package:final_project/components/rounded_icon_button.dart';
import 'package:final_project/new_nav.dart';
import 'package:final_project/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';


class CustomAppBarDetails extends StatelessWidget {

  @override
  // AppBar().preferredSize.height provide us the height that apply on our app bar
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedIconBtn(
              iconData: Icons.arrow_back,
              press: () => Navigator.pop(context)),

          ],
        ),
      ),
    );
  }
}
