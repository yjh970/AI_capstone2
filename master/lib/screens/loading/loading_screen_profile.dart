import 'package:final_project/constants.dart';
import 'package:final_project/screens/profile/profile_screen.dart';
import 'package:final_project/services/auth.dart';
import 'package:final_project/services/cartService.dart';
import 'package:final_project/services/favoriteService.dart';
import 'package:final_project/services/user_product_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingScreenProfile extends StatelessWidget {
  static String routeName = '/loadingProfile';
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    UserProductService proUserService =
        Provider.of<UserProductService>(context, listen: false);
    CartService cartService = Provider.of<CartService>(context, listen: false);
    FavoriteService favoriteService =
        Provider.of<FavoriteService>(context, listen: false);
    Future.delayed(Duration(seconds: 2), () async {
      // await for the Firebase initialization to occur

      proUserService.getUserProductsCollectionFromFirebase().then((value) {
        cartService
            .getProductCartFromFirebase(_auth.getCurrentUser())
            .then((value) {
          favoriteService
              .getProductFavoriteFromFirebase(_auth.getCurrentUser())
              .then((value) {
            Navigator.pushReplacementNamed(context, ProfileScreen.routeName);
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
