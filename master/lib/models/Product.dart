import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Product{
  final int price;
  final String id;
  final String title, meeting_description, mentor_description, name;
  final List<String> image;
  final double rating;
  final bool isNew;

  Product({
    required this.name,
    required this.id,
    required this.image,
    // required this.images,
    this.rating = 0.0,
    this.isNew = true,
    required this.price,
    required this.title,
    required this.meeting_description,
    required this.mentor_description,
});

  factory Product.fromJson(Map<String, dynamic> json){

    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      title: json['title'],
      meeting_description: json['meeting_description'],
      mentor_description: json['mentor_description'],
      isNew: json['isNew'],
      image: List<String>.from(json['image'].map((x) => x)),
      rating: json['rating'],

    );
  }
}
