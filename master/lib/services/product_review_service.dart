import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/models/Product.dart';
import 'package:final_project/models/Review.dart';
import 'package:firebase_core/firebase_core.dart';

import 'auth.dart';

class ProductReviewService {
  FirebaseFirestore? _instance;

  List<Review> _productReviews = [];

  List<Review> getProductReviews() {
    return _productReviews;
  }

  Future<void> getProductReviewFromFirebase(title) async {
    _productReviews = [];
    _instance = FirebaseFirestore.instance;
    CollectionReference reviews = _instance!.collection('reviews');
    DocumentSnapshot snapshot = await reviews.doc('${title}').get();
    var data = snapshot.data() as Map;
    var reviewsData = data['Reviews'] as List<dynamic>;
    reviewsData.forEach((revData) {
      //아직 로그인안되어 있어서 getCurrentUser()가 안됨
      print('id matches User');
      _productReviews.add(Review.fromJson(revData));
    });
  }
}