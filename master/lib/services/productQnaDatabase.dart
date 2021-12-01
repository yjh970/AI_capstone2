import 'package:cloud_firestore/cloud_firestore.dart';

class QnaDatabaseService {
  final String title;

  QnaDatabaseService({required this.title});

  final CollectionReference userDataCollection =
  FirebaseFirestore.instance.collection('qnas');

  Future updateQnaData(String id, String question, String date) async {
    Map<String, dynamic> qnaMap = Map();
    qnaMap['id'] = id;
    qnaMap['question'] = question;
    qnaMap['date'] = date;
    return await userDataCollection.doc(title).set({
      'QnAs': FieldValue.arrayUnion([qnaMap])
    }, SetOptions(merge: true));
  }
}
