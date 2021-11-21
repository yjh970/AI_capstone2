
import 'package:final_project/screens/profile/components/profile_cart.dart';
import 'package:final_project/screens/profile/components/profile_favorite.dart';
import 'package:final_project/screens/profile/components/profile_menu.dart';
import 'package:final_project/screens/profile/components/profile_picture.dart';
import 'package:final_project/screens/senior/senior_screen.dart';
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
            text: '계정 정보',
            press: (){},
          ),
          ProfileMenu(
            icon: 'assets/icons/Cart Icon.svg',
            text: '수강 내역',
            press: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return ProfileCart();
                  },
                ),
              );
            },
          ),
          ProfileMenu(
            icon: 'assets/icons/Heart Icon.svg',
            text: '즐겨찾기',
            press: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return ProfileFavorite();
                  },
                ),
              );
            },
          ),
          ProfileMenu(
            icon: 'assets/icons/Question mark.svg',
            text: '고객 센터',
            press: (){},
          ),
          ProfileMenu(
            icon: 'assets/icons/Log out.svg',
            text: '로그아웃',
            press: (){},
          ),
      ProfileMenu(
        icon: 'assets/icons/Settings.svg',
        text: '미팅 관리(시니어 전용)',
        press: ()=>Navigator.pushNamed(context, SeniorScreen.routeName),
      ),
        ],
      ),
    );
  }
}
