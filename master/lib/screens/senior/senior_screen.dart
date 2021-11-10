import 'package:final_project/components/bottom_nav.bar.dart';
import 'package:final_project/screens/senior/components/body.dart';
import 'package:flutter/material.dart';

import '../../enums.dart';

class SeniorScreen extends StatelessWidget {
  static String routeName = '/senior';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("미팅 관리"),
      ),
      body: Body(),
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
