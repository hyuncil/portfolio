import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_happy/controller/add_controller.dart';
import 'package:flutter_happy/pages/new.dart';
import 'package:flutter_happy/pages/route_page.dart';

import 'login.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          AddController.to.authStateChanges(snapshot.data);
          if (!snapshot.hasData) {
            return LoginWidget();
          } else {
            return RoutePage();
          }
        });
  }
}