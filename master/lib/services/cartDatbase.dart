import 'package:cloud_firestore/cloud_firestore.dart';

import 'auth.dart';

class CartDatabaseService {

  final CollectionReference userCartCollection =
  FirebaseFirestore.instance.collection('cart');
  final AuthService _auth = AuthService();

  Future updateCartData(String title, String name, String link) async {
    Map<String, dynamic> cartMap = Map();
    cartMap['title'] = title;
    cartMap['name'] = name;
    cartMap['link'] = link;
    return await userCartCollection.doc(_auth.getCurrentUser()).set({
      'cartProduct': FieldValue.arrayUnion([cartMap])
    }, SetOptions(merge: true));
  }

  Future deleteCartData(String title, String name, String link) async {
    Map<String, dynamic> cartMap = Map();
    cartMap['title'] = title;
    cartMap['name'] = name;
    cartMap['link'] = link;
    return await userCartCollection.doc(_auth.getCurrentUser()).set({
      'cartProduct': FieldValue.arrayRemove([cartMap])
    }, SetOptions(merge: true));
  }



}