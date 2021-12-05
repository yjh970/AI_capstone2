import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/models/Product.dart';

class ProductService {

  FirebaseFirestore? _instance;

  List<Product> _products = [];

  List<Product> getProducts() {
    return _products;
  }

  List<Product> getProducts2(){
    return _products;
  }


  Future<void> getProductsCollectionFromFirebase() async{
    _products = [];
    _instance = FirebaseFirestore.instance;
    CollectionReference products = _instance!.collection('products');
    DocumentSnapshot snapshot = await products.doc('W2TO2uQlQ3T2iEvxxom3').get();
    var data = snapshot.data() as Map;
    var productsData = data['Products'] as List<dynamic>;
    productsData.forEach((proData) {
      _products.add(Product.fromJson(proData));
      print(_products);
    });
  }
}