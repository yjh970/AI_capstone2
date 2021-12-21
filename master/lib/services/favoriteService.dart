import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:final_project/models/cart_item.dart';
import 'package:final_project/models/favorite_item.dart';

class FavoriteService {
  FirebaseFirestore? _instance;

  List<FavoriteItem> _favItems = [];

  bool? _exists;

  List<FavoriteItem> getProductFavorite() {
    return _favItems;
  }

  Future<void> getProductFavoriteFromFirebase(id) async {
    _favItems = [];
    _instance = FirebaseFirestore.instance;
    CollectionReference carts = _instance!.collection('favorites');
    DocumentSnapshot snapshot = await carts.doc(id).get();
    if(snapshot.exists == true){
      var data = snapshot.data() as Map;
      var favData = data['favoriteProduct'] as List<dynamic>;
      favData.forEach((fData) {
        //아직 로그인안되어 있어서 getCurrentUser()가 안됨
        print('id matches User');
        _favItems.add(FavoriteItem.fromJson(fData));
      });
    }
    else{
      _favItems = [];
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