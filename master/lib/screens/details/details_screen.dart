import 'package:final_project/models/Product.dart';
import 'package:final_project/screens/details/components/body.dart';
import 'package:final_project/services/product_selection_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/custom_app_bar_details.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = '/details';
  Product? selectedProduct;

  @override
  Widget build(BuildContext context) {
    ProductSelectionService proSelection =
        Provider.of<ProductSelectionService>(context, listen: false);
    selectedProduct = proSelection.selectedProduct;

    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBarDetails(),
      ),
      body: Body(),
    );
  }
}
