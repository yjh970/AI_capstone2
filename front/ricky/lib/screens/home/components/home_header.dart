import 'package:final_project/screens/home/components/search_field.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'logo_field.dart';


class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20), vertical: 10),
      child: Row(
        children: [
          SizedBox(width: getProportionateScreenWidth(5)),
          buildLogoContainer(),
          Spacer(),
          buildSearchContainer()
        ],
      ),
    );
  }
}