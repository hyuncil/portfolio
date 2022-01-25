import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_happy/controller/image_controller.dart';
import 'package:flutter_happy/model/user_model.dart';
import 'package:flutter_happy/model/user_model_result.dart';
import 'package:flutter_happy/repository/add_repository.dart';
import 'package:flutter_happy/repository/firestorage_repository.dart';
import 'package:flutter_happy/repository/repository.dart';
import 'package:get/get.dart';

class AddController extends GetxController {
  static AddController get to => Get.find();
  File imageFile;
  TextEditingController titleController = TextEditingController();
  TextEditingController discriptionController = TextEditingController();
  FirestorageRepository _firestorageRepository = FirestorageRepository();



  RxBool isEditProfile = false.obs;
  Rx<UserModelResult> userResult = UserModelResult(items:[]).obs;

  Rx<UserModels> userModel =
      UserModels(title: '귀여운 사진', discription: '행복한 하루').obs;
  Rx<List<UserModels>> user = Rx<List<UserModels>>([]);
  List<UserModels> get users => user.value;
  UserModels models = UserModels();
  @override
  void onInit() {
    super.onInit();

   user.bindStream(AddRepository().getAllEmployees());

  }
  authStateChanges(User firebaseUser) async {
    if (firebaseUser != null) {
      UserModels userModels =
          await FirebaseRepository.findUserByUid(firebaseUser.uid);
      if (userModels != null) {
        models = userModels;
        FirebaseRepository.updateLastLoginDate(
            userModels.docId, DateTime.now());
      } else {
        models = UserModels(
            uid: firebaseUser.uid,
            name: firebaseUser.displayName,
            avatarUrl: firebaseUser.photoURL,
            createdTime: DateTime.now(),
            lastLoginTime: DateTime.now());
        String docId = await FirebaseRepository.signup(models);
        models.docId = docId;
      }
    }
 userModel(UserModels.clone(models));
  }

  fetchData() {
    userModel.value.title = titleController.text;
    userModel.update((title) {
      title.title = title.title;
    });

    userModel.value.discription = discriptionController.text;
    userModel.update((discription) {
      discription.discription = discription.discription;
    });

    String userTitle = userModel.value.title;
    String userdiscrip = userModel.value.discription;
    AddRepository.loadData(models.uid, models.docId, userTitle, userdiscrip,models.backgroundUrl,);
    TextClear();
  }


  TextClear() {
    titleController.clear();
    discriptionController.clear();

  }

  pickImage() async {
    File file = await ImageCropController.to.selectImage();
    //if (file == null) return;
    userModel.update((my) => my.backgroundFile = file);
    models = userModel.value;
    save();


  }

  void save() {
    models = userModel.value;

    if (models.backgroundFile != null) {
      UploadTask task = _firestorageRepository.uploadImageFile(
          models.uid, models.backgroundFile.path.toString(), models.backgroundFile);
      task.snapshotEvents.listen((event) async {
        if (event.bytesTransferred == event.totalBytes) {
          String downloadUrl = await event.ref.getDownloadURL();
          _updateProfileImageUrl(downloadUrl);
          FirebaseRepository.updateImageUrl(
              models.docId, downloadUrl, 'backgroundUrl ');
        }
      });
    }

    FirebaseRepository.updateData(models.docId, models);
  }

  void _updateProfileImageUrl(String downloadUrl) {
    models.backgroundUrl = downloadUrl;
    userModel.update((user) => user.backgroundUrl = downloadUrl);
  }

}
