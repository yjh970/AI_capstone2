
import 'package:final_project/screens/home/components/popular_products.dart';
import 'package:final_project/screens/home/components/special_offers.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'event_banner.dart';
import 'home_header.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          HomeHeader(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          EventBanner(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          SpecialOffers(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          PopularProducts(),
          SizedBox(
            height: getProportionateScreenHeight(80),
          ),
        ],
      ),
    ));
  }
}
