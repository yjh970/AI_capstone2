import 'dart:async';
import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/models/Product.dart';
import 'package:final_project/models/app_user.dart';
import 'package:final_project/models/cart_item.dart';
import 'package:final_project/services/accountDatabase.dart';
import 'package:final_project/services/product_selection_service.dart';
import 'package:final_project/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth.dart';

class CartService extends ChangeNotifier {
  List<CartItem> _items = [];
  FirebaseFirestore? _instance;

  UnmodifiableListView<CartItem> get items => UnmodifiableListView(_items);

  void add(BuildContext context, CartItem item) {
    _items.add(item);

    AuthService authService = Provider.of<AuthService>(context, listen: false);
    Map<String, dynamic> cartMap = Map();
    _items.forEach((CartItem item) {
      cartMap['title'] = (item.product as Product).title;
      cartMap['name'] = (item.product as Product).name;
    });

    _instance = FirebaseFirestore.instance;
    _instance!
        .collection('cart')
        .doc(authService.getCurrentUser()) //need to get logged in account's id
        .update({
      'cartProduct': FieldValue.arrayUnion([cartMap])
    }).then((value) {
      print(_items.length);
      notifyListeners();
    });
  }

  void remove(BuildContext context, CartItem item) {
    _items.removeWhere((_item) => _item.product == item.product);

    AuthService authService = Provider.of<AuthService>(context, listen: false);
    Map<String, dynamic> cartMap = Map();
    cartMap['title'] = (item.product as Product).title;
    cartMap['name'] = (item.product as Product).name;
    _instance = FirebaseFirestore.instance;
    _instance!.collection('cart').doc(authService.getCurrentUser()).update({
      'cartProduct': FieldValue.arrayRemove([cartMap]),
    }).then((value) {

      print(_items.length);
      notifyListeners();
    });
  }


  bool isProductAddedToCart(Product? pro) {

    return _items.length >= 0 ? _items.any(
            (CartItem item) => item.product!.title == pro!.title) : false;
  }


  // void loadCartItemsFromFirebase(BuildContext context) {
  //   if (_items.length > 0) {
  //     _items.clear();
  //   }
  //   AuthService authService = Provider.of<AuthService>(context, listen: false);
  //   ProductService proService =
  //       Provider.of<ProductService>(context, listen: false);
  //   ProductSelectionService proSelectionService =
  //       Provider.of<ProductSelectionService>(context, listen: false);
  //
  //   FirebaseFirestore.instance
  //       .collection('cart')
  //       .doc(authService.getCurrentUser())
  //       .get()
  //       .then((DocumentSnapshot snapshot) {
  //         if(snapshot.exists){
  //           Map<String, dynamic> cartItems = snapshot.get(FieldPath(['cartProduct']));
  //
  //           proService.getProducts().forEach((Product pro) {
  //             if(cartItems.keys.contains(pro.title)){
  //               _items.add(CartItem(
  //                 product:pro)
  //               );
  //             }
  //           });
  //           notifyListeners();
  //         }
  //
  //   });
  // }
}
