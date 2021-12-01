import 'package:final_project/components/bottom_nav.bar.dart';
import 'package:final_project/screens/home/components/body.dart';
import 'package:flutter/material.dart';

import '../../enums.dart';
class HomeScreen extends StatelessWidget {
  static String routeName = '/home';


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Body(),
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
