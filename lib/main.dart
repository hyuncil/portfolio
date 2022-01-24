import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_happy/binding/initbinding.dart';
import 'package:flutter_happy/controller/add_controller.dart';
import 'package:flutter_happy/controller/app_controller.dart';
import 'package:flutter_happy/pages/app.dart';
import 'package:flutter_happy/pages/detail_page.dart';
import 'package:flutter_happy/pages/new.dart';
import 'package:flutter_happy/pages/route_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false,
      initialBinding: InitBindings(),
      initialRoute: '/',getPages: [
        GetPage(name: '/', page:()=> App()),
      GetPage(name: '/detail', page: ()=>DetailPage()),
        GetPage(name: '/NewPage', page: ()=>NewPage(),binding:BindingsBuilder(()=>Get.lazyPut<RouteController>(() => RouteController())))

    ],
      title: 'Happy',
      theme: ThemeData(
        primaryColor: Colors.limeAccent,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
home: App(),

    );
  }
}
