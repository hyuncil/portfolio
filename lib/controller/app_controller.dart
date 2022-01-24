import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_happy/controller/image_controller.dart';
import 'package:flutter_happy/model/user_model.dart';
import 'package:get/get.dart';

enum RouteName { New, Top, Search, Add }
 
class RouteController extends GetxService {


   static RouteController get to => Get.find();
  RxInt currentIndex = 0.obs;
Rx<UserModels> userModel = UserModels().obs;
  void changePageIndex(int index) {
    currentIndex(index);
  }
void backpage (){
    currentIndex(0);
}
}
