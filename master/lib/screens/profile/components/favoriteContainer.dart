import 'package:final_project/screens/profile/components/product_add_qna.dart';
import 'package:final_project/screens/profile/components/product_add_rating.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class FavoriteContainer extends StatelessWidget {
  const FavoriteContainer({
    Key? key,
    required this.name,
    required this.title,
  }) : super(key: key);

  final String? name;
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(title!,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: kPrimaryColor)),
                      ),
                      Container(
                        child: Text(name!,
                            style: TextStyle(color: kPrimaryColor)),
                      ),
                    ],
                  ),
                  SizedBox(width: 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
