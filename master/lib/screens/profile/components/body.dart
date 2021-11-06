
import 'package:final_project/screens/profile/components/profile_cart.dart';
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
            icon: 'assets/icons/Question mark.svg',
            text: '설정',
            press: (){},
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
          )
        ],
      ),
    );
  }
}
