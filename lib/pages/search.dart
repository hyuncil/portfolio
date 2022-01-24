import 'package:flutter_happy/component/cutom_appbar.dart';
import 'package:flutter_happy/component/picture_widget.dart';
import 'package:flutter_happy/controller/add_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Search extends GetView<AddController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CustomScrollView(
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
    ));
  }
}
