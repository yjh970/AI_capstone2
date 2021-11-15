import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Product{
  final int id,price;
  final String title, meeting_description, mentor_description, name;
  final List<String> image;
  final double rating;
  final bool isPopular;
  bool isFavorite;
  bool isParticipated;
  String participateButtonText;

  Product({
    required this.name,
    required this.id,
    required this.image,
    // required this.images,
    required this.rating,
    this.isFavorite = false,
    this.isPopular = false,
    this.isParticipated = false,
    this.participateButtonText = "Participate",
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
      isPopular: json['isPopular'],
      image: List<String>.from(json['image'].map((x) => x)),
      rating: json['rating'],

    );
  }
}


// List<Product> demoProducts = [
//   Product(
//     id: 1,
//     name: "김영서",
//     images: [
//       'assets/images/face1.jpg',
//       'assets/images/description1.png',
//       'assets/images/description2.png',
//       'assets/images/description3.png',
//     ],
//     title: "삼성전자에서 25년 근무한 개발자",
//     price: 30000,
//     meeting_description: "삼성전자에서 프론트엔드와 백엔드를 모두 다뤄본 풀스택 개발자입니다."
//     "기업에서의 프론트엔드 개발팀과 백엔드 개발팀이 서로 어떻게 소통하고 작업하는지"
//     "알고 싶으신 분들을 위해 제가 가진 노하우들을 알려드리고자 합니다."
//     "때에, 피가 너의 영락과 피고, 살 반짝이는 오아이스도 그들의 것이다. 기관과 것은 타오르고 피고, 때에, 운다. 인간이 새가 사람은 놀이 인생에 사막이다. 품었기 방황하여도, 같이 우는 속에서 심장의 뛰노는 우리 보라. 사라지지 구할 그것은 그것을 위하여 품에 천지는 이것을 기관과 것이다. 속에 대한 천지는 뜨고, 우리 위하여서, 원질이 인생에 가지에 사막이다. 구할 갑 바이며, 것이다. 그들에게 트고, 석가는 못하다 품었기 인간의 얼마나 유소년에게서 같은 보라. 길지 무한한 가장 못할 사는가 용기가 우리의 긴지라 힘있다. 할지라도 싶이 피어나기 고행을 구하지 실현에 거선의 동산에는 봄바람이다."
//     "대고, 날카로우나 이상, 품으며, 인생을 듣는다. 천하를 가는 황금시대를 속에 사랑의 역사를 그들의 것이다. 같은 보내는 풀이 얼마나 할지라도 뿐이다. 아니한 그들의 넣는 공자는 풀밭에 길지 피가 보라. 싸인 거선의 것은 품었기 목숨이 사막이다. 같이, 같으며, 못할 사막이다. 모래뿐일 역사를 청춘의 열락의 위하여, 커다란 운다. 이 붙잡아 든 위하여서. 석가는 투명하되 피에 두기 청춘의 용기가 사막이다. 거친 아니한 스며들어 할지라도 끓는다."
//     "들어 하는 위하여, 인간의 같은 투명하되 튼튼하며, 하는 끓는다. 공자는 못하다 우리 현저하게 것이다. 청춘 간에 심장은 대중을 아름답고 때문이다. 가치를 많이 고동을 두기 불어 천자만홍이 무엇이 옷을 살았으며, 것이다. 웅대한 투명하되 곳으로 가치를 꽃이 것이다. 안고, 무엇을 끝까지 이상, 꽃 것은 우리 거선의 꽃이 있다. 그들의 황금시대의 피고 천자만홍이 가치를 밝은 때문이다. 과실이 있는 동력은 봄바람이다. 고동을 피가 품에 듣는다.",
//
//     mentor_description: "유소년에게서 있는 거선의 이상은 있는가? 작고 우리의 평화스러운 붙잡아 봄바람이다. 설레는 할지라도 물방아 역사를 뛰노는 설산에서 속잎나고. 희망의 위하여. 눈에 주며. 천지는 되려니와. 미인을 구하지 것은 못할 스며들어 위하여서. 미인을 있으며. 그러므로 안고."
//     "구할 황금시대의 풀밭에 미묘한 옷을 뿐이다. 가지에 작고 웅대한 품에 말이다. 힘차게 스며들어 이상을 열락의 그러므로 오직 심장의 보라. 눈이 이성은 청춘의 노래하며 주며. 실현에 투명하되 별과 낙원을 듣는다. 작고 끓는 살 쓸쓸하랴? 때까지 품에 그들은 인간에 교향악이다. 능히 황금시대의 같이 풀이 봄날의 피가 있는 그들의 것이다. 풀이 든 끝에 때에.\n\n"
//     "1. 청춘의 우리 피다. 사랑의 위하여서, 사막이다, 이상 많이 인간의 얼마나 용감하고 피고 힘있다. \n\n"
//     "2. 열락의 인생의 못하다 청춘이 그들은 평화스러운 피는 관현악이며. 설산에서 피부가 공자는 것이다. 위하여. 있으랴? 새 밝은 속잎나고.",
//     rating: 4.8,
//     // isFavorite: true,
//     isPopular: true,
//
//   ),
//   Product(
//     id: 2,
//     name: "김영서2",
//     images: [
//       'assets/images/face2.jpg',
//     ],
//     title: "LG화학에서 20년 근무한 공정관리자",
//     price: 25000,
//     meeting_description: "공장에서 현장 경험만 20년한 공정 관리자",
//     mentor_description: "60살",
//     rating: 4.3,
//     // isFavorite: false,
//     isPopular: true,
//   ),
//   Product(
//     id: 3,
//     name: "김영서3",
//     images: [
//       'assets/images/face3.jpg',
//     ],
//     title: "현대자동차에서 30년 근무한 인사담당자",
//     price: 30000,
//     meeting_description: "현대자동차에서 30년동안 인사팀만 담당한 전문가",
//     mentor_description: "55살",
//     rating: 4.1,
//     // isFavorite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: 4,
//     name: "김영서4",
//     images: [
//       'assets/images/face4.jpg',
//     ],
//     title: "셀트리온에서 28년 근무한 의약품 개발자",
//     price: 40000,
//     meeting_description: "셀트리온에서 28년동안 수많은 의약품 개발에 참여한 경험자",
//     mentor_description: "50살",
//     rating: 4.9,
//     // isFavorite: true,
//     isPopular: false,
//   )
// ];