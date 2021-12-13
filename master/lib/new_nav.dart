import 'package:final_project/constants.dart';
import 'package:final_project/screens/category/category_screen.dart';
import 'package:final_project/screens/home/home_screen.dart';
import 'package:final_project/screens/notification/notification_screen.dart';
import 'package:final_project/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'bottom_navigation_icons.dart';


class NewNav extends StatefulWidget {
  const NewNav({Key? key}) : super(key: key);

  @override
  NewNavState createState() => NewNavState();
}


//class MainPageState extends State<MainPage> with SingleTickerProviderStateMixin{
class NewNavState extends State<NewNav> with SingleTickerProviderStateMixin{
  TabController? controller;
  String? id;





  @override
  void initState(){
    super.initState();
    controller = TabController(length: 4, vsync: this);


  }


  @override
  void dispose(){
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:TabBarView(
          children:<Widget>[
            HomeScreen(),
            CategoryScreen(),
            NotificationScreen(),
            ProfileScreen(),

          ],
          controller: controller,

        ),

        bottomNavigationBar: TabBar(
          tabs: <Widget>[

            Tab(
              icon:Icon(BottomNavigationIcons.home,size:30),text:'홈',iconMargin: EdgeInsets.only(bottom: 5),
            ),
            Tab(
              icon:Icon(BottomNavigationIcons.category,size:30),text:'카테고리',iconMargin: EdgeInsets.only(bottom: 5),
            ),
            Tab(
              icon:Icon(BottomNavigationIcons.notification,size:30),text:'알림',iconMargin: EdgeInsets.only(bottom: 5),
            ),
            Tab(
                icon:Icon(BottomNavigationIcons.profile,size:30),text:'프로필',iconMargin: EdgeInsets.only(bottom: 5)
            ),

          ],

          labelColor:kPrimaryColor,
          unselectedLabelColor: Colors.black38,
          indicatorColor: kPrimaryColor,
          controller:controller,
          indicatorWeight: 5,
          labelStyle: TextStyle(fontSize: 14),
          labelPadding: EdgeInsets.all(0),

        )

    );


  }



}
