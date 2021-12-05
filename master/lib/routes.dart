import 'package:final_project/screens/details/details_screen.dart';
import 'package:final_project/screens/forgot_password/forgot_password_screen.dart';
import 'package:final_project/screens/home/home_screen.dart';
import 'package:final_project/screens/loading/loading_screen.dart';
import 'package:final_project/screens/loading/loading_screen_details.dart';
import 'package:final_project/screens/loading/loading_screen_home.dart';
import 'package:final_project/screens/loading/loading_screen_notifications.dart';
import 'package:final_project/screens/loading/loading_screen_profile.dart';
import 'package:final_project/screens/login_success/login_success_screen.dart';
import 'package:final_project/screens/category/category_screen.dart';
import 'package:final_project/screens/profile/profile_screen.dart';
import 'package:final_project/screens/senior/senior_screen.dart';
import 'package:final_project/screens/sign_in/sign_in_screen.dart';
import 'package:final_project/screens/sign_up/sign_up_screen.dart';
import 'package:final_project/screens/splash/splash_screen.dart';
import 'package:final_project/screens/notification/notification_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  LoadingScreen.routeName: (context) => LoadingScreen(),
  LoadingScreenHome.routeName: (context) => LoadingScreenHome(),
  LoadingScreenProfile.routeName: (context) => LoadingScreenProfile(),
  LoadingScreenNotifications.routeName: (context) => LoadingScreenNotifications(),
  LoadingScreenDetails.routeName: (context) => LoadingScreenDetails(),
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  CategoryScreen.routeName: (context) => CategoryScreen(),
  NotificationScreen.routeName:(context) => NotificationScreen(),
  SeniorScreen.routeName:(context)=> SeniorScreen()

};