import 'package:final_project/components/bottom_nav.bar.dart';
import 'package:final_project/screens/home/components/body.dart';
import 'package:final_project/services/product_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../enums.dart';
import '../../size_config.dart';

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
