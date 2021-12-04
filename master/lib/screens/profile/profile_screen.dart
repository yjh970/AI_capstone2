import 'package:final_project/components/bottom_nav.bar.dart';
import 'package:final_project/screens/profile/components/body.dart';
import 'package:flutter/material.dart';

import '../../enums.dart';
import 'components/custom_app_bar_profile.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBarProfile(),
      ),
      body: Body(),
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
