import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewDatabaseService {
  final String title;

  ReviewDatabaseService({required this.title});

  final CollectionReference userDataCollection =
      FirebaseFirestore.instance.collection('reviews');

  Future updateReviewData(String id, String reviewString, double rating) async {
    Map<String, dynamic> reviewMap = Map();
    reviewMap['id'] = id;
    reviewMap['reviewString'] = reviewString;
    reviewMap['rating'] = rating;
    return await userDataCollection.doc(title).set({
      'Reviews': FieldValue.arrayUnion([reviewMap])
    }, SetOptions(merge: true));
  }
}
