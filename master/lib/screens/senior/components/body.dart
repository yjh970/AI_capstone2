import 'package:final_project/screens/senior/components/senior_introduction.dart';
import 'package:final_project/screens/senior/components/senior_message.dart';
import 'package:final_project/screens/senior/components/senior_user.dart';
import 'package:final_project/screens/senior/components/senior_qna.dart';
import 'package:final_project/screens/senior/components/senior_rating.dart';
import 'package:final_project/screens/senior/components/senior_status.dart';
import 'package:final_project/screens/senior/components/senior_add.dart';
import 'package:final_project/screens/senior/components/senior_menu.dart';
import 'package:flutter/material.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SeniorMenu(
            icon: 'assets/icons/Add.svg',
            text: '미팅 추가',
            press: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return SeniorAdd();
                  },
                ),
              );
            },
          ),
          SeniorMenu(
            icon: 'assets/icons/Status.svg',
            text: '미팅 현황',
            press: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return SeniorStatus();
                  },
                ),
              );
            },
          ),
          SeniorMenu(
            icon: 'assets/icons/Introduction.svg',
            text: '미팅 소개 수정',
            press: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return SeniorIntroduction();
                  },
                ),
              );
            },
          ),
          SeniorMenu(
            icon: 'assets/icons/User.svg',
            text: '강사 소개 수정',
            press: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return SeniorUser();
                  },
                ),
              );
            },
          ),
          SeniorMenu(
            icon: 'assets/icons/Rating.svg',
            text: '평점 확인',
            press: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return SeniorRating();
                  },
                ),
              );
            },
          ),
          SeniorMenu(
            icon: 'assets/icons/Question mark.svg',
            text: 'QnA 확인',
            press: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return SeniorQna();
                  },
                ),
              );
            },
          ),
          SeniorMenu(
            icon: 'assets/icons/Mail.svg',
            text: '메시지 보내기',
            press: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return SeniorMessage();
                  },
                ),
              );
            },
          ),

        ],
      ),
    );
  }
}