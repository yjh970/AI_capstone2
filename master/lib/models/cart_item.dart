import 'package:final_project/models/Product.dart';
import 'package:flutter/material.dart';

class CartItem {
  final String title;
  final String name;
  final String link;

  CartItem( {required this.title, required this.name, required this.link});

  factory CartItem.fromJson(Map<String, dynamic> json){
    return CartItem(title: json['title'], name: json['name'], link: json['link']);
  }
}