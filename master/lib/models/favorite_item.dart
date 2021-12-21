import 'package:final_project/models/Product.dart';
import 'package:flutter/material.dart';

class FavoriteItem {
  final String title;
  final String name;

  FavoriteItem( {required this.title, required this.name});

  factory FavoriteItem.fromJson(Map<String, dynamic> json){
    return FavoriteItem(title: json['title'], name: json['name']);
  }
}