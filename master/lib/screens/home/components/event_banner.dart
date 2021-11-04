import 'package:flutter/material.dart';

import '../../../size_config.dart';


class EventBanner extends StatelessWidget {
  const EventBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenHeight(30)),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          text: "App Launch Event\n",
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(
              text: "20% Discount of all Meetings",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
