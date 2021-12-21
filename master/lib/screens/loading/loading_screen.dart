import 'package:final_project/constants.dart';
import 'package:final_project/screens/splash/splash_screen.dart';
import 'package:final_project/services/product_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatelessWidget {
  static String routeName = '/loading';


  @override
  Widget build(BuildContext context) {

    ProductService proService = Provider.of<ProductService>(context, listen: false);

    Future.delayed(Duration(seconds: 2), () async {

      // await for the Firebase initialization to occur
       await Firebase.initializeApp();

      proService.getProductsCollectionFromFirebase()
          .then((value) {
        Navigator.pushReplacementNamed(context, SplashScreen.routeName);
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
                      valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor.withOpacity(0.5)),
                    ),
                  ),
                )
              ],
            )
        )
    );
  }
}