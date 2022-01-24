import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_happy/controller/add_controller.dart';
import 'package:flutter_happy/model/user_model.dart';
import 'package:get/get.dart';

class PictureWidget extends GetView<AddController> {
  final UserModels use;

  const PictureWidget({this.use});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_PictureZone(), _TitleZone()],
    );
  }

  _PictureZone() {
    return Container(
      height: 250,
      color: Colors.grey,
      child: Image.network('${use.backgroundUrl}',
      ),
    );
  }

  _TitleZone() {
    return Text(
      "${use.name}",
      maxLines: 2,
    );
  }
}
