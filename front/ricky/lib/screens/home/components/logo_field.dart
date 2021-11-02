import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';


Container buildLogoContainer() {
  return Container(
    width: SizeConfig.screenWidth * 0.2,
    height: 60,
    decoration: BoxDecoration(
      color: kSecondaryColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Image.asset('assets/images/logo.jpg', fit: BoxFit.fill,),
  );
}

