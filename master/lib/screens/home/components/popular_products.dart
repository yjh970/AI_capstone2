import 'package:final_project/components/product_card.dart';
import 'package:final_project/models/Product.dart';
import 'package:final_project/screens/details/details_screen.dart';
import 'package:final_project/screens/home/components/more_details.dart';
import 'package:final_project/screens/home/components/section_title.dart';
import 'package:final_project/screens/loading/loading_screen_details.dart';
import 'package:final_project/services/product_selection_service.dart';
import 'package:final_project/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../size_config.dart';

class PopularProducts extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    ProductSelectionService proSelection = Provider.of<ProductSelectionService>(context, listen: false);
    ProductService proService = Provider.of<ProductService>(context, listen: false);
    List<Product> products = proService.getProducts();

    return Column(
      children: [
        SectionTitle(text: "New Meetings", press: () {
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
                3, //seeMore button을 구현하게 된다면 여기 length을 지정하고, seemore 을 클릭했을 때 길이를 demoProducts.length으로 지정
                (index) {
                  if (products[index].isNew == true) //Product.dart에서 isPopular = false라고 지정하면 안나옴.
                    return ProductCard(
                      product: products[index],
                      onCardClick: (){
                        proSelection.selectedProduct = products[index];
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
    );
  }
}
