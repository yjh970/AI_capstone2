import 'package:final_project/models/Product.dart';
import 'package:final_project/screens/details/components/body.dart';
import 'package:flutter/material.dart';

import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArgument arguments =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArgument;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(
          rating: arguments.product.rating,
        ),
      ),
      body: Body(
        product: arguments.product,
      ),
    );
  }
}

class ProductDetailsArgument {
  //제품 정보를 가지고 올 떄 필요한 argument class
  final Product product;

  ProductDetailsArgument({required this.product});
}
