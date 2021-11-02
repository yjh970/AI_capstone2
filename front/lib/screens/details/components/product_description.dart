import 'package:final_project/models/Product.dart';
import 'package:final_project/screens/details/components/product_description_meeting.dart';
import 'package:final_project/screens/details/components/product_description_senior.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'categories.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool isReadMore = false;
  List<String> categories = ["미팅소개", "강사 소개", "후기", "Q&A"];
  int selectedIndex = 0; //Default은 미팅소개 화면


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Text(widget.product.title,
                style: Theme.of(context).textTheme.headline6),
          ),
          const SizedBox(height: 1),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              width: getProportionateScreenWidth(64),
              decoration: BoxDecoration(
                  color: widget.product.isFavorite
                      ? Color(0xFFFFE6E6)
                      : Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: SvgPicture.asset(
                'assets/icons/Heart Icon_2.svg',
                color: widget.product.isFavorite
                    ? Color(0xFFFF4848)
                    : Color(0xFFDBDEE4),
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: getProportionateScreenWidth(20)),
            child: SizedBox(
              height: 25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return buildCategory(index);
                },
              ),
            ),
          ),
          //tab index가 바뀔 때 내용이 바뀌게끔 해야됨
          ProductDescriptionMeeting(product: widget.product),
          ProductDescriptionSenior(product: widget.product),
        ],
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
