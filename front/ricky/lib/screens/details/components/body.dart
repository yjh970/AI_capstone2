import 'package:final_project/components/default_button.dart';
import 'package:final_project/components/rounded_icon_button.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/models/Product.dart';
import 'package:final_project/screens/details/components/product_description.dart';
import 'package:final_project/screens/details/components/product_images.dart';
import 'package:final_project/screens/details/components/top_rounded_container.dart';
import 'package:final_project/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(product: product),
          TopRoundedContainer(
            height: 300,
            color: Colors.white,
            child: ProductDescription(
              product: product,
            ),
          ),
          TopRoundedContainer(
            height: 150,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.15,
                right: SizeConfig.screenWidth * 0.15,
                top: getProportionateScreenWidth(15),
                bottom: getProportionateScreenWidth(40),
              ),
              child: DefaultButton(
                text: "Participate",
                press: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
