import 'package:final_project/constants.dart';
import 'package:final_project/screens/home/home_screen.dart';
import 'package:final_project/screens/profile/profile_screen.dart';
import 'package:final_project/screens/splash/splash_screen.dart';
import 'package:final_project/services/product_service.dart';
import 'package:final_project/services/user_product_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingScreenProfile extends StatelessWidget {
  static String routeName = '/loadingProfile';


  @override
  Widget build(BuildContext context) {

    UserProductService proUserService = Provider.of<UserProductService>(context, listen: false);

    Future.delayed(Duration(seconds: 3), () async {

      // await for the Firebase initialization to occur

      proUserService.getUserProductsCollectionFromFirebase()
          .then((value) {
        Navigator.restorablePushNamed(context, ProfileScreen.routeName);
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