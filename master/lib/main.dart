import 'package:final_project/constants.dart';
import 'package:final_project/models/Cart.dart';
import 'package:final_project/routes.dart';
import 'package:final_project/screens/profile/profile_screen.dart';
import 'package:final_project/screens/splash/splash_screen.dart';
import 'package:final_project/size_config.dart';
import 'package:final_project/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        // home: SplashScreen(),
        initialRoute: SplashScreen.routeName,
        //원래는 SplashScreen이 기본 값
        routes: routes,
      ),
    );
  }
}
