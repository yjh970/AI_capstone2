
import 'package:flutter/material.dart';
import 'package:final_project/screens/notification/components/notification_menu.dart';



class Body extends StatelessWidget {
  List categoryList = [
      '"삼성전자에서 25년 근무한 개발자" 미팅 1시간 전 입니다.',
    '"LG화학에서 20년 근무한 공정관리자" 미팅 1시간 전 입니다.',
    '"현대자동차에서 30년 근무한 인사담당자" 미팅 1시간 전 입니다.'];
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        primary: false,
        padding : const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 1,
        childAspectRatio: 6/1,
        children: <Widget>[
          for(var item in categoryList)
            NotificationMenu(
              text:item,
            ),
      ],

    );



  }
}
