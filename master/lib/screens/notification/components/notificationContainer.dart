import 'package:final_project/screens/profile/components/product_add_qna.dart';
import 'package:final_project/screens/profile/components/product_add_rating.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class NotificationContainer extends StatelessWidget {
  const NotificationContainer({
    Key? key,
    required this.link,
    required this.title,
  }) : super(key: key);

  final String? link;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset.zero)
            ]),
        child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(title!,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: kPrimaryColor)),
                ),
                SizedBox(height: 20,),
                Container(
                  child: Text(link!,
                      style: TextStyle(fontSize: 14, color: kPrimaryColor),
                  maxLines: 2,),
                ),
              ],
            ),
      ),
    );
  }
}
