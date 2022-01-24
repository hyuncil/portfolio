import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_happy/model/user_model.dart';

class AddRepository {
  static Future<String> loadData(
      uid, docId, Title,discription, backgroundUrl) async {
    final f = FirebaseFirestore.instance.collection('UserData');
    f.add({
      'uid': uid,
      'docId': docId,
      'name': Title,
      'userData': discription,
      'backgroundUrl': backgroundUrl,
      'dateTime': DateTime.now()
    });
  }

  static Future<UserModels> findUserBybackgroundUrl(String uid) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    QuerySnapshot data = await users.where('uid', isEqualTo: uid).get();
    if (data.size == 0) {
      return null;
    } else {
      return UserModels.fromJson(data.docs[0].data(), data.docs[0].id);
    }
  }
  final f = FirebaseFirestore.instance.collection('UserData')
      .orderBy(
      'dateTime', descending: true);

  Stream<List<UserModels>> getAllEmployees() =>
      f.snapshots().map((query) =>
          query.docs.map((item) => UserModels.fromMap(item)).toList());

}
