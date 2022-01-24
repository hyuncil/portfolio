import 'package:flutter/material.dart';
import 'package:flutter_happy/component/cutom_appbar.dart';
import 'package:flutter_happy/component/picture_widget.dart';
import 'package:flutter_happy/controller/add_controller.dart';
import 'package:get/get.dart';

class Top30 extends GetView<AddController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() => CustomScrollView(
            slivers: [
              SliverAppBar(
                title: CustomAppBar(),
                floating: true,
                snap: true,
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                return GestureDetector(
                    onTap: () {
                      Get.toNamed('/detail');
                    },
                    child: PictureWidget(
                      use: controller.user.value[index],
                    ));
              }, childCount: controller.user.value.length))
            ],
          )),
    );
  }
}
