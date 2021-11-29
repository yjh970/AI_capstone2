import 'package:final_project/constants.dart';
import 'package:final_project/models/Product.dart';
import 'package:final_project/screens/details/details_screen.dart';
import 'package:final_project/screens/home/home_screen.dart';
import 'package:final_project/screens/splash/splash_screen.dart';
import 'package:final_project/services/product_review_service.dart';
import 'package:final_project/services/product_selection_service.dart';
import 'package:final_project/services/product_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingScreenDetails extends StatefulWidget {
  static String routeName = '/loadingDetails';
  Product? product;

  @override
  State<LoadingScreenDetails> createState() => _LoadingScreenDetailsState();
}

class _LoadingScreenDetailsState extends State<LoadingScreenDetails> {
  @override
  Widget build(BuildContext context) {

    ProductService proService = Provider.of<ProductService>(context, listen: false);
    ProductSelectionService proSelection =
    Provider.of<ProductSelectionService>(context, listen: false);
    widget.product = proSelection.selectedProduct;
    ProductReviewService revService = Provider.of<ProductReviewService>(context, listen: false);
    String title = widget.product!.title;


    Future.delayed(Duration(seconds: 3), () async {

      // await for the Firebase initialization to occur

      revService.getProductReviewFromFirebase(title)
          .then((value) {
        Navigator.restorablePushNamed(context, DetailsScreen.routeName);
      });
    });

    return Material(
        child: Container(
            color: kPrimaryColor.withOpacity(0.4),
            alignment: Alignment.center,
            child: Stack(
              children: [
                Align(
                  child: Image.asset('assets/images/logo.jpg'),
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: CircularProgressIndicator(
                      strokeWidth: 10,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black.withOpacity(0.5)),
                    ),
                  ),
                )
              ],
            )
        )
    );
  }
}