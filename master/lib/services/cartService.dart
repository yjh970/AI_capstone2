import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/models/cart_item.dart';

class CartService {
  FirebaseFirestore? _instance;

  List<CartItem> _cartItems = [];

  bool? _exists;

  List<CartItem> getProductCart() {
    return _cartItems;
  }

  Future<void> getProductCartFromFirebase(id) async {
    _cartItems = [];
    _instance = FirebaseFirestore.instance;
    CollectionReference carts = _instance!.collection('cart');
    DocumentSnapshot snapshot = await carts.doc(id).get();
    if(snapshot.exists == true){
      var data = snapshot.data() as Map;
      var cartData = data['cartProduct'] as List<dynamic>;
      cartData.forEach((cData) {
        //아직 로그인안되어 있어서 getCurrentUser()가 안됨
        print('id matches User');
        _cartItems.add(CartItem.fromJson(cData));
      });
    }
    else{
      _cartItems = [];
    }
  }

  Future<bool> checkIfDocExists(String docId) async {
    try {
      // Get reference to Firestore collection
      var collectionRef = _instance!.collection('reviews');
      var doc = await collectionRef.doc(docId).get();
      return doc.exists;
    } catch (e) {
      throw e;
    }
  }
}