
import 'package:final_project/screens/notification/components/body.dart';
import 'package:flutter/material.dart';


class NotificationMenu extends StatelessWidget {
  const NotificationMenu({
    required this.message,
    required this.title,
    required this.date,
    required this.senderName,

  });

  final String message;
  final String title;
  final String date;
  final String senderName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xFFF5F6F9),),
        height: 80,
        margin: EdgeInsets.all(1),
        child: Column(
          children: [
            Text('${title}      ${date}'),

                Text('${senderName}님이 보내신 메시지입니다.'),
            Text(message)
              ]



        )


    ),
        onTap:(){Body().categoryList.add('1');}
    );

  }
}
