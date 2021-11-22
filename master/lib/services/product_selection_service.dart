import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/models/Product.dart';
import 'package:flutter/material.dart';

class ProductSelectionService extends ChangeNotifier{

  FirebaseFirestore? _instance;
  Product? _selectedProduct;

  Product? get selectedProduct => _selectedProduct;
  set selectedProduct(Product? value) {
    _selectedProduct = value;
    notifyListeners();
  }

}