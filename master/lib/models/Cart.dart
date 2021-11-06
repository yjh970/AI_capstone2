import 'package:flutter/material.dart';

import 'Product.dart';

class Cart with ChangeNotifier{
  List<Product> productCart = [];

  void addToCart(Product product) => productCart.add(product);
}