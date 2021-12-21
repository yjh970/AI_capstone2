import 'package:cloud_firestore/cloud_firestore.dart';

import 'auth.dart';

class FavoriteDatabaseService {

  final CollectionReference userFavoriteCollection =
  FirebaseFirestore.instance.collection('favorites');
  final AuthService _auth = AuthService();

  Future updateFavoriteData(String title, String name) async {
    Map<String, dynamic> favMap = Map();
    favMap['title'] = title;
    favMap['name'] = name;
    return await userFavoriteCollection.doc(_auth.getCurrentUser()).set({
      'favoriteProduct': FieldValue.arrayUnion([favMap])
    }, SetOptions(merge: true));
  }

  Future deleteFavoriteData(String title, String name) async {
    Map<String, dynamic> favMap = Map();
    favMap['title'] = title;
    favMap['name'] = name;
    return await userFavoriteCollection.doc(_auth.getCurrentUser()).set({
      'favoriteProduct': FieldValue.arrayRemove([favMap])
    }, SetOptions(merge: true));
  }



}