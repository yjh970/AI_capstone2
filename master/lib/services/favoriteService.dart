import 'dart:async';
import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/models/Product.dart';
import 'package:final_project/models/app_user.dart';
import 'package:final_project/models/cart_item.dart';
import 'package:final_project/models/favorite_item.dart';
import 'package:final_project/services/database.dart';
import 'package:final_project/services/product_selection_service.dart';
import 'package:final_project/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth.dart';

class FavoriteService extends ChangeNotifier {
  List<FavoriteItem> _items = [];
  FirebaseFirestore? _instance;

  UnmodifiableListView<FavoriteItem> get items => UnmodifiableListView(_items);

  void add(BuildContext context, FavoriteItem item) {
    _items.add(item);

    AuthService authService = Provider.of<AuthService>(context, listen: false);
    Map<String, dynamic> favMap = Map();
    _items.forEach((FavoriteItem item) {
      favMap['title'] = (item.product as Product).title;
      favMap['name'] = (item.product as Product).name;
    });

    _instance = FirebaseFirestore.instance;
    _instance!
        .collection('favorites')
        .doc(authService.getCurrentUser()) //need to get logged in account's id
        .update({
      'favoriteProduct': FieldValue.arrayUnion([favMap])
    }).then((value) {
      print(_items.length);
      notifyListeners();
    });
  }

  void remove(BuildContext context,  FavoriteItem item) {
    _items.removeWhere((_item) => _item.product == item.product);

    AuthService authService = Provider.of<AuthService>(context, listen: false);
    Map<String, dynamic> cartMap = Map();
    cartMap['title'] = (item.product as Product).title;
    cartMap['name'] = (item.product as Product).name;
    _instance = FirebaseFirestore.instance;
    _instance!.collection('favorites').doc(authService.getCurrentUser()).update({
      'favoriteProduct': FieldValue.arrayRemove([cartMap]),
    }).then((value) {

      print(_items.length);
      notifyListeners();
    });
  }


  bool isProductAddedToFavorite(Product? pro) {

    return _items.length >= 0 ? _items.any(
            (FavoriteItem item) => item.product!.title == pro!.title) : false;
  }


  // void loadFavoriteItemsFromFirebase(BuildContext context) {
  //   if (_items.length > 0) {
  //     _items.clear();
  //   }
  //   AuthService authService = Provider.of<AuthService>(context, listen: false);
  //   ProductService proService =
  //   Provider.of<ProductService>(context, listen: false);
  //   ProductSelectionService proSelectionService =
  //   Provider.of<ProductSelectionService>(context, listen: false);
  //
  //   FirebaseFirestore.instance
  //       .collection('favorites')
  //       .doc(authService.getCurrentUser())
  //       .get()
  //       .then((DocumentSnapshot snapshot) {
  //     Map<String, String> cartItems = snapshot.get(FieldPath(['favoriteProduct']));
  //     notifyListeners();
  //   });
  // }
}
