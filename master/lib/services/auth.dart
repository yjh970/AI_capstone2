import 'package:final_project/models/app_user.dart';
import 'package:final_project/services/accountDatabase.dart';
import 'package:final_project/services/productDatabase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    return uid;
  }
  AppUser? _appUser;
  AppUser? get loggedInAppUser => _appUser;

  //create user object based on FirebaseUser
  AppUser? _userFromFirebaseUser(User? user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }


  //sign in with email & password

  Future SignInWithEmailAndPassword(String? email, String? password) async {
    try{      UserCredential result = await auth.signInWithEmailAndPassword(
        email: email!, password: password!);
    User? user = result.user;
    if(user!= null) {
      _appUser = AppUser(
        uid: result.user!.uid,
      );
    }

    notifyListeners();
    print(_appUser!.uid);

    return user;}
    catch(e) {
      print(e.toString());
      return null;
    }

  }



  //register
  Future registerWithEmailAndPassword(
      String? email,
      String? password,
      String? name,
      String? jobGroup,
      String? phoneNumber,
      String? specification) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      User? user = result.user;

      //create a new document for the user with the uid
      await AccountDatabaseService(uid: user!.uid).updateUserData(
          email, password, name!, jobGroup!, phoneNumber!, specification!);
      return _userFromFirebaseUser(user);

    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//sign out

}
