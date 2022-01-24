import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_happy/controller/add_controller.dart';
import 'package:flutter_happy/repository/repository.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomAppBar extends GetView<AddController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _logo(),
          _actions()
        ],
      ),
    );
  }

  _logo() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top:30.0),
        child: Image.asset(
          'assets/images/smile.logo.png',
          width: 200,
        ),
      ),
    );
  }

  _actions() {
    return Row(
      children: [
        CircleAvatar(radius: 25,
          backgroundColor: Colors.limeAccent,
          backgroundImage: Image.network('${controller.userModel.value.avatarUrl}').image,
        ),


      ],
    );
  }
}
