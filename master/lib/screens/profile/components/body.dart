import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/screens/profile/components/profile_cart.dart';
import 'package:final_project/screens/profile/components/profile_favorite.dart';
import 'package:final_project/screens/profile/components/profile_menu.dart';
import 'package:final_project/screens/profile/components/profile_picture.dart';
import 'package:final_project/screens/senior/senior_screen.dart';
import 'package:final_project/services/auth.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final AuthService _auth = AuthService();
  String specification = "";

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
            press: () {},
          ),
          ProfileMenu(
            icon: 'assets/icons/Cart Icon.svg',
            text: '수강 내역',
            press: () {
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
            press: () {
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
            press: () {},
          ),
          ProfileMenu(
            icon: 'assets/icons/Log out.svg',
            text: '로그아웃',
            press: () {},
          ),
          StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Accounts')
                .doc(_auth.getCurrentUser())
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return new CircularProgressIndicator();
              }
              Widget renderedButton;
              var document = snapshot.data;
              print(document!['specification']);
              specification = document['specification'];
              if (specification == "Senior") {
                renderedButton = ProfileMenu(
                  icon: 'assets/icons/Settings.svg',
                  text: '미팅 관리(시니어 전용)',
                  press: () => Navigator.pushNamed(context, SeniorScreen.routeName),
                );
              } else {
                renderedButton = SizedBox(height: 10);
              }
              return renderedButton;
            },
          ),
        ],
      ),
    );
  }
}
