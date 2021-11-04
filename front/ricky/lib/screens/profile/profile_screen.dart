import 'package:final_project/components/bottom_nav.bar.dart';
import 'package:final_project/screens/profile/components/body.dart';
import 'package:flutter/material.dart';

import '../../enums.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Body(),
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
