import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModels {
  String uid;
  String docId;
  String name;
  String title;
  String discription;
  String avatarUrl;
  String pictureUrl;
  String backgroundUrl;
  File avatarFile;
  File backgroundFile;
  DateTime lastLoginTime;
  DateTime createdTime;

  UserModels({
    this.uid,
    this.docId,
    this.name='',
    this.title='',
    this.avatarUrl,
    this.pictureUrl,
    this. backgroundUrl,
    this.discription='',
    this.createdTime,
    this.lastLoginTime,
  });
  UserModels.clone(UserModels user)
      : this(
      uid: user.uid,
      docId: user.docId,
      name: user.name,
      discription: user.discription,
      avatarUrl: user.avatarUrl,
      backgroundUrl: user.backgroundUrl,
      lastLoginTime: user.lastLoginTime,
      createdTime: user.createdTime);

  UserModels.fromJson(Map<String, dynamic> json, String docId):
        uid = json["uid"] as String,
        docId = docId,
        name = json["name"] as String,
        title = json["title"] as String,
        avatarUrl = json["avatar_url"] as String,
        pictureUrl = json["pictureUrl"] as String,
        discription = json["discription"] as String,
        lastLoginTime = json["last_Login_Time"].toDate(),
        createdTime = json["created_Time"].toDate();

Map<String,dynamic>toMap(){
  return {
    "uid":this.uid,
    "name":this.name,
    "title":this.title,
    "avatar_url":this.avatarUrl,
    "picture_url":this.pictureUrl,
    "discription":this.discription,
    "created_Time":this.createdTime,
    "last_Login_Time":this.lastLoginTime,
  };
}
  Map<String,dynamic>toMap1(){
    return {
      "uid":this.uid,
      "title":this.title,
      "discription":this.discription,
      "created_Time":this.createdTime,
      "last_Login_Time":this.lastLoginTime,
    };
  }

  UserModels.fromMap(DocumentSnapshot data) {
    uid = data.id ;
    docId = data["docId"];
    name = data["name"];
    discription = data["userData"];
     backgroundUrl = data["backgroundUrl"];
   //lastLoginTime = data["dateTime"];


  }


}
