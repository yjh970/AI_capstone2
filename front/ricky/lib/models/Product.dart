import 'package:flutter/material.dart';

class Product{
  final int id,price;
  final String title, description, name;
  final List<String> images;
  final List<Color> colors;
  final double rating;
  final bool isFavorite, isPopular;

  Product({
    required this.name,
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavorite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
});
}

List<Product> demoProducts = [
  Product(
    id: 1,
    name: "김영서",
    images: [
      'assets/images/face1.jpg',
      'assets/images/description1.png',
      'assets/images/description2.png',
      'assets/images/description3.png',
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white
    ],
    title: "삼성전자에서 25년 근무한 개발자",
    price: 30000,
    description: "삼성전자에서 프론트엔드와 백엔드를 모두 다뤄본 풀스택 개발자입니다."
    "기업에서의 프론트엔드 개발팀과 백엔드 개발팀이 서로 어떻게 소통하고 작업하는지"
    "알고 싶으신 분들을 위해 제가 가진 노하우들을 알려드리고자 합니다.",
    rating: 4.8,
    isFavorite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    name: "김영서2",
    images: [
      'assets/images/face2.jpg',
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white
    ],
    title: "LG화학에서 20년 근무한 공정관리자",
    price: 25000,
    description: "공장에서 현장 경험만 20년한 공정 관리자",
    rating: 4.3,
    isFavorite: false,
    isPopular: true,
  ),
  Product(
    id: 3,
    name: "김영서3",
    images: [
      'assets/images/face3.jpg',
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white
    ],
    title: "현대자동차에서 30년 근무한 인사담당자",
    price: 30000,
    description: "현대자동차에서 30년동안 인사팀만 담당한 전문가",
    rating: 4.1,
    isFavorite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    name: "김영서4",
    images: [
      'assets/images/face4.jpg',
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white
    ],
    title: "셀트리온에서 28년 근무한 의약품 개발자",
    price: 40000,
    description: "셀트리온에서 28년동안 수많은 의약품 개발에 참여한 경험자",
    rating: 4.9,
    isFavorite: true,
    isPopular: false,
  )
];