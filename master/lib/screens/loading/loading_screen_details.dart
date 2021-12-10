import 'package:final_project/constants.dart';
import 'package:final_project/models/Product.dart';
import 'package:final_project/screens/details/details_screen.dart';
import 'package:final_project/services/auth.dart';
import 'package:final_project/services/cartService.dart';
import 'package:final_project/services/favoriteService.dart';
import 'package:final_project/services/product_qna_service.dart';
import 'package:final_project/services/product_review_service.dart';
import 'package:final_project/services/product_selection_service.dart';
import 'package:final_project/services/product_service.dart';
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
    final AuthService _auth = AuthService();
    ProductService proService =
        Provider.of<ProductService>(context, listen: false);
    ProductSelectionService proSelection =
        Provider.of<ProductSelectionService>(context, listen: false);
    widget.product = proSelection.selectedProduct;
    ProductReviewService revService =
        Provider.of<ProductReviewService>(context, listen: false);
    String title = widget.product!.title;
    ProductQnAService qService =
        Provider.of<ProductQnAService>(context, listen: false);
    CartService cartService = Provider.of<CartService>(context, listen: false);
    FavoriteService favoriteService =
        Provider.of<FavoriteService>(context, listen: false);

    Future.delayed(Duration(seconds: 2), () async {
      print(title);

      // await for the Firebase initialization to occur

      revService.getProductReviewFromFirebase(title).then((value) {
        qService.getProductQnaFromFirebase(title).then((value) {
          cartService
              .getProductCartFromFirebase(_auth.getCurrentUser())
              .then((value) {
            favoriteService
                .getProductFavoriteFromFirebase(_auth.getCurrentUser())
                .then((value) {
              Navigator.restorablePushNamed(context, DetailsScreen.routeName);
            });
          });
        });
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
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.black.withOpacity(0.5)),
                    ),
                  ),
                )
              ],
            )));
  }
}
