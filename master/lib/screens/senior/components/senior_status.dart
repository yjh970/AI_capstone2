
import 'package:final_project/components/product_card.dart';
import 'package:final_project/models/Product.dart';
import 'package:final_project/screens/details/details_screen.dart';
import 'package:final_project/services/product_selection_service.dart';
import 'package:final_project/services/user_product_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../../size_config.dart';



class SeniorStatus extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    ProductSelectionService proSelection = Provider.of<ProductSelectionService>(context, listen: false);
    UserProductService userProService = Provider.of<UserProductService>(context, listen: false);
    List<Product> userProducts = userProService.getUserProducts();
    return Scaffold(
      appBar: AppBar(
        title: Text("미팅 현황"),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2/3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: userProducts.length, //총 Popular Meetings의 개수
        itemBuilder: (BuildContext context, index) {
          if(userProducts[index].isNew == true)
            return ProductCard(
                product: userProducts[index],
                onCardClick:  () {
                  proSelection.selectedProduct = userProducts[index];
                  Navigator.pushNamed(context, DetailsScreen.routeName);
                }
            );
          return SizedBox.shrink();
        },
      ),
    );
  }
}
