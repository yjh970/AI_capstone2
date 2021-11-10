import 'package:final_project/components/bottom_nav.bar.dart';
import 'package:final_project/screens/notification/components/body.dart';
import 'package:flutter/material.dart';


import '../../enums.dart';

class NotificationScreen extends StatelessWidget {
  static String routeName = '/notification';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alarm"),
      ),
      body: Body(),
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.notification),
    );
  }
}
