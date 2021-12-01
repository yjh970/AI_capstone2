import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/models/Product.dart';
import 'package:final_project/models/QnA.dart';
import 'package:final_project/models/Review.dart';
import 'package:firebase_core/firebase_core.dart';

import 'auth.dart';

class ProductQnAService {
  FirebaseFirestore? _instance;

  List<QnA> _productQnAs = [];

  List<QnA> getProductQnAs() {
    return _productQnAs;
  }

  Future<void> getProductQnaFromFirebase(title) async {
    _productQnAs = [];
    _instance = FirebaseFirestore.instance;
    CollectionReference reviews = _instance!.collection('qnas');
    DocumentSnapshot snapshot = await reviews.doc(title).get();
    if(snapshot.exists == true){
      var data = snapshot.data() as Map;
      var qnaData = data['QnAs'] as List<dynamic>;
      qnaData.forEach((qData) {
        //아직 로그인안되어 있어서 getCurrentUser()가 안됨
        print('id matches User');
        _productQnAs.add(QnA.fromJson(qData));
      });
    }
    else{
      _productQnAs = [];
    }
  }

  Future<bool> checkIfDocExists(String docId) async {
    try {
      // Get reference to Firestore collection
      var collectionRef = _instance!.collection('qnas');
      var doc = await collectionRef.doc(docId).get();
      return doc.exists;
    } catch (e) {
      throw e;
    }
  }
}
