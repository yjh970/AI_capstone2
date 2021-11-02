import 'package:final_project/screens/complete_profile/complete_profile_screen.dart';
import 'package:final_project/screens/details/details_screen.dart';
import 'package:final_project/screens/forgot_password/forgot_password_screen.dart';
import 'package:final_project/screens/home/home_screen.dart';
import 'package:final_project/screens/login_success/login_success_screen.dart';
import 'package:final_project/screens/profile/profile_screen.dart';
import 'package:final_project/screens/sign_in/sign_in_screen.dart';
import 'package:final_project/screens/sign_up/sign_up_screen.dart';
import 'package:final_project/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
};