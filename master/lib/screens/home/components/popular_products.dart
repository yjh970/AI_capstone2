import 'package:final_project/components/product_card.dart';
import 'package:final_project/models/Product.dart';
import 'package:final_project/screens/home/components/more_details.dart';
import 'package:final_project/screens/home/components/section_title.dart';
import 'package:final_project/screens/loading/loading_screen_details.dart';
import 'package:final_project/services/product_selection_service.dart';
import 'package:final_project/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

import '../../../size_config.dart';

class PopularProducts extends StatelessWidget {
  final FirebaseAnalytics analytics = FirebaseAnalytics();


  @override
  Widget build(BuildContext context) {
    ProductSelectionService proSelection = Provider.of<ProductSelectionService>(context, listen: false);
    ProductService proService = Provider.of<ProductService>(context, listen: false);
    List<Product> popularProducts = proService.getProducts();
    final List<Product> popularProductsReversed = new List.from(popularProducts.reversed);
    List<Product> recommendedProducts = proService.getProducts();
    List<Product> similarProducts = new List.from(recommendedProducts);
    recommendedProducts.shuffle();


    return Column(
      children: [
        Column(
          children: [
            SectionTitle(text: "Recommended Meetings", press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MoreDetails()),
              );
            }),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    5, //seeMore button을 구현하게 된다면 여기 length을 지정하고, seemore 을 클릭했을 때 길이를 demoProducts.length으로 지정
                        (index) {
                      if (recommendedProducts[index].isNew == true) //Product.dart에서 isPopular = false라고 지정하면 안나옴.
                        return ProductCard(
                          product: recommendedProducts[index],
                          onCardClick: (){
                            proSelection.selectedProduct = recommendedProducts[index];

                            analytics.logEvent(name : 'meeting_click', parameters: {'title' : recommendedProducts[index].title});

                            Navigator.pushNamed(context, LoadingScreenDetails.routeName);

                          },
                        );
                      return SizedBox.shrink();
                    },
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(20),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: getProportionateScreenHeight(40),
        ),
        Column(
          children: [
            SectionTitle(text: "Similar Meetings", press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MoreDetails()),
              );
            }),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    5, //seeMore button을 구현하게 된다면 여기 length을 지정하고, seemore 을 클릭했을 때 길이를 demoProducts.length으로 지정
                        (index) {
                      if (similarProducts[index].isNew == true) //Product.dart에서 isPopular = false라고 지정하면 안나옴.
                        return ProductCard(
                          product: similarProducts[index],
                          onCardClick: (){
                            proSelection.selectedProduct = similarProducts[index];
                            Navigator.pushNamed(context, LoadingScreenDetails.routeName);
                          },
                        );
                      return SizedBox.shrink();
                    },
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(20),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: getProportionateScreenHeight(40),
        ),
        Column(
          children: [
            SectionTitle(text: "Popular Products", press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MoreDetails()),
              );
            }),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    5, //seeMore button을 구현하게 된다면 여기 length을 지정하고, seemore 을 클릭했을 때 길이를 demoProducts.length으로 지정
                        (index) {
                      if (popularProductsReversed[index].isNew == true) //Product.dart에서 isPopular = false라고 지정하면 안나옴.
                        return ProductCard(
                          product: popularProductsReversed[index],
                          onCardClick: (){
                            proSelection.selectedProduct = popularProductsReversed[index];
                            Navigator.pushNamed(context, LoadingScreenDetails.routeName);
                          },
                        );
                      return SizedBox.shrink();
                    },
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(20),
                  )
                ],
              ),
            ),
          ],
        ),
      ]
    );
  }
}
