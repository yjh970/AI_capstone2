import 'package:flutter/material.dart';

import 'Product.dart';

class Favorite with ChangeNotifier{
  List<Product> productFavorite = [];

  void addToFavorite(Product product) => productFavorite.add(product);
  void removeFavorite(Product product) => productFavorite.remove(product);
}