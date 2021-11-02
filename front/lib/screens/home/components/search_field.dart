import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';



Container buildSearchContainer() {
  return Container(
    width: SizeConfig.screenWidth * 0.65,
    height: 50,
    decoration: BoxDecoration(
      color: kSecondaryColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(15),
    ),
    child: TextField(
      onChanged: (value) {
        //Search Meetings
      },
      decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: 'Search Meetings',
          prefixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenHeight(9))),
    ),
  );
}