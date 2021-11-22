import 'package:final_project/components/product_card.dart';
import 'package:final_project/models/Product.dart';
import 'package:final_project/screens/details/details_screen.dart';
import 'package:final_project/services/product_selection_service.dart';
import 'package:final_project/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoreDetails extends StatelessWidget {
  const MoreDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductSelectionService proSelection = Provider.of<ProductSelectionService>(context, listen: false);
    ProductService proService = Provider.of<ProductService>(context, listen: false);
    List <Product> products = proService.getProducts();

    return Scaffold(
      appBar: AppBar(
        title: Text("All Popular Meetings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1/ 1.5,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: 3, //총 Popular Meetings의 개수
          itemBuilder: (BuildContext context, index) {
            if(products[index].isPopular == true)
            return ProductCard(
              product: products[index],
              onCardClick:  () {
                proSelection.selectedProduct = products[index];
                Navigator.pushNamed(context, DetailsScreen.routeName);
              }
            );
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
