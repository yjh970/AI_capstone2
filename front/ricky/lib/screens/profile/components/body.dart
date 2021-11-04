
import 'package:final_project/screens/profile/components/profile_menu.dart';
import 'package:final_project/screens/profile/components/profile_picture.dart';
import 'package:flutter/material.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfilePicture(),
          SizedBox(
            height: 20,
          ),
          ProfileMenu(
            icon: 'assets/icons/User Icon.svg',
            text: 'My Account',
            press: (){},
          ),
          ProfileMenu(
            icon: 'assets/icons/Bell.svg',
            text: 'Notifications',
            press: (){},
          ),
          ProfileMenu(
            icon: 'assets/icons/Question mark.svg',
            text: 'Settings',
            press: (){},
          ),
          ProfileMenu(
            icon: 'assets/icons/Question mark.svg',
            text: 'Help Center',
            press: (){},
          ),
          ProfileMenu(
            icon: 'assets/icons/Log out.svg',
            text: 'Log Out',
            press: (){},
          )
        ],
      ),
    );
  }
}
