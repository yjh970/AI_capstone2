
import 'package:final_project/screens/notification/components/notice.dart';
import 'package:final_project/screens/notification/components/body.dart';
import 'package:flutter/material.dart';


class NotificationMenu extends StatelessWidget {
  const NotificationMenu({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child: Container(
        child:Center(
          child: Text(this.text)),
            color: Color(0xFFF5F6F9),

    ),
        onTap:(){Body().categoryList.add('1');}
    );

  }
}
