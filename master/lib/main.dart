import 'package:final_project/routes.dart';
import 'package:final_project/screens/loading/loading_screen.dart';
import 'package:final_project/services/auth.dart';
import 'package:final_project/services/cartService.dart';
import 'package:final_project/services/favoriteService.dart';
import 'package:final_project/services/product_qna_service.dart';
import 'package:final_project/services/product_review_service.dart';
import 'package:final_project/services/product_selection_service.dart';
import 'package:final_project/services/product_service.dart';
import 'package:final_project/services/user_product_service.dart';
import 'package:final_project/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/Favorite.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    Future.delayed(Duration(seconds: 3), () async {
      await Firebase.initializeApp();
    });

    // CartService cartService = Provider.of<CartService>(context, listen: false);
    // cartService.loadCartItemsFromFirebase(context);
    //
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Favorite()),
        ChangeNotifierProvider(
          create: (context) => ProductSelectionService(),
        ),
        Provider(
          create: (context) => ProductService(),
        ),
        Provider(
          create: (context) => UserProductService(),
        ),
        Provider(
          create: (context) => ProductReviewService(),
        ),
        Provider(
          create: (context) => ProductQnAService(),
        ),
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => CartService()),
        ChangeNotifierProvider(create: (context) => FavoriteService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        // home: SplashScreen(),
        initialRoute: LoadingScreen.routeName,
        //원래는 SplashScreen이 기본 값
        routes: routes,
      ),
    );
  }
}
