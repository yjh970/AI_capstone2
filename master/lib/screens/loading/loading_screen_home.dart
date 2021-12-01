import 'package:final_project/constants.dart';
import 'package:final_project/screens/home/home_screen.dart';
import 'package:final_project/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingScreenHome extends StatelessWidget {
  static String routeName = '/loadingHome';


  @override
  Widget build(BuildContext context) {

    ProductService proService = Provider.of<ProductService>(context, listen: false);

    Future.delayed(Duration(seconds: 2), () async {

      // await for the Firebase initialization to occur

      proService.getProductsCollectionFromFirebase()
          .then((value) {
        Navigator.restorablePushNamed(context, HomeScreen.routeName);
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