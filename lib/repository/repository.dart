import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_happy/model/user_model.dart';
import 'package:get/get.dart';

class FirebaseRepository {
  static Future<String> signup(UserModels user) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    DocumentReference drf = await users.add(user.toMap());
    return drf.id;
  }

  static Future<UserModels> findUserByUid(String uid) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    QuerySnapshot data = await users.where('uid', isEqualTo: uid).get();
    if (data.size == 0) {
      return null;
    } else {
      return UserModels.fromJson(data.docs[0].data(), data.docs[0].id);
    }
  }

  static void updateLastLoginDate(String docId, DateTime time) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users.doc(docId).update({'date_last_login': time});
  }

  static void updateData(String docId, UserModels user) {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    users.doc(docId).update(user.toMap());
  }

  static void updateImageUrl(String docId, String url, String fieldName) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users.doc(docId).update({fieldName: url});

  }
}
