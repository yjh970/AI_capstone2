import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;

  DatabaseService({required this.uid});

  final CollectionReference userDataCollection = FirebaseFirestore.instance
      .collection('Accounts');

  Future updateUserData(String email, String password, String name,
      String jobGroup, String phoneNumber, String specification) async {
    return await userDataCollection.doc(uid).set({
      'email': email,
      'password' : password,
      'name': name,
      'jobGroup' : jobGroup,
      'phoneNumber' : phoneNumber,
      'specification': specification,
    });
  }
}

