import 'package:final_project/screens/category/category_screen.dart';
import 'package:final_project/screens/home/home_screen.dart';
import 'package:final_project/screens/loading/loading_screen_home.dart';
import 'package:final_project/screens/loading/loading_screen_profile.dart';
import 'package:final_project/screens/notification/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';
import '../enums.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key, required this.selectedMenu}) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/home.svg",
                  color: MenuState.home == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, HomeScreen.routeName)
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/category.svg",
                  color: MenuState.category == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, CategoryScreen.routeName),
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/notification.svg",
                  color: MenuState.notification == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, NotificationScreen.routeName),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/profile.svg",
                  color: MenuState.profile == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                Navigator.pushNamed(context, LoadingScreenProfile.routeName),
              ),
            ],
          )),
    );
  }
}
