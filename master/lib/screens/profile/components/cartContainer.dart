import 'package:final_project/screens/profile/components/product_add_qna.dart';
import 'package:final_project/screens/profile/components/product_add_rating.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class CartContainer extends StatelessWidget {
  const CartContainer({
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
                  Container(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("Tapped");
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return ProductAddRating(
                                      productTitle: title!);
                                },
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 10,
                                      offset: Offset.zero)
                                ]),
                            child: Text(
                              "후기 등록",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("Tapped");
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return ProductAddQna(
                                      productTitle: title!);
                                },
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 10,
                                      offset: Offset.zero)
                                ]),
                            child: Text(
                              "질문하기 ",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
