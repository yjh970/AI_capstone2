import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/models/Product.dart';
import 'package:firebase_core/firebase_core.dart';

import 'auth.dart';

class UserProductService {

  FirebaseFirestore? _instance;

  List<Product> _userProducts = [];


  List<Product> getUserProducts() {
    return _userProducts;
  }

  Future<void> getUserProductsCollectionFromFirebase() async{
    final AuthService _auth = AuthService();
    _userProducts = [];
    _instance = FirebaseFirestore.instance;
    CollectionReference products = _instance!.collection('products');
    DocumentSnapshot snapshot = await products.doc('W2TO2uQlQ3T2iEvxxom3').get();
    var data = snapshot.data() as Map;
    var productsData = data['Products'] as List<dynamic>;
    productsData.forEach((proData) {
      if(proData['id'] == _auth.getCurrentUser()) //아직 로그인안되어 있어서 getCurrentUser()가 안됨
          {
        print('id matches User');
        _userProducts.add(Product.fromJson(proData));
      }
    });
  }
}