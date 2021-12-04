import 'package:cloud_firestore/cloud_firestore.dart';

class ProductDatabaseService {

  ProductDatabaseService();


  final CollectionReference productCollection = FirebaseFirestore.instance
      .collection('products');

  Future updateProductData(String meetingTitle, String mentorName, String meetingDescription,
      String mentorDescription, int price, String id, List<String> meetingImage) async {
    Map<String, dynamic>productMap = Map();
    productMap['id'] = id;
    // productMap['image'] = meetingImage;
    productMap['image'] = [meetingImage[0], meetingImage[1]];
    productMap['meeting_description'] = meetingDescription;
    productMap['mentor_description'] = mentorDescription;
    productMap['name'] = mentorName;
    productMap['price'] = price;
    productMap['title'] = meetingTitle;
    productMap['isNew'] = true;
    productMap['rating'] = 0.1;
    return await productCollection.doc('W2TO2uQlQ3T2iEvxxom3').update({
      'Products' : FieldValue.arrayUnion([productMap])
    });
  }
}

