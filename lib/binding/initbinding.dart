import 'package:flutter_happy/controller/add_controller.dart';
import 'package:flutter_happy/controller/app_controller.dart';
import 'package:flutter_happy/controller/image_controller.dart';
import 'package:get/instance_manager.dart';

class InitBindings implements Bindings{
  @override
  void dependencies() {
    Get.put(RouteController());
    Get.put(AddController());
    Get.put(ImageCropController());
  }

}