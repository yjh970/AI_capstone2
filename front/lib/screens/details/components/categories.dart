import 'package:final_project/models/Product.dart';
import 'package:final_project/screens/details/components/product_description_meeting.dart';
import 'package:final_project/screens/details/components/product_description_senior.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["미팅소개", "강사 소개", "후기", "Q&A"];
  int selectedIndex = 0; //Default은 미팅소개 화면

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(20)),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                categories[index],
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: selectedIndex == index
                      ? Colors.black
                      : Colors.black.withOpacity(0.3),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: getProportionateScreenHeight(1),
                ),
                height: getProportionateScreenHeight(2),
                width: getProportionateScreenWidth(30),
                color:
                    selectedIndex == index ? kPrimaryColor : Colors.transparent,
              ),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
