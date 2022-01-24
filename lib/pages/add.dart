

import 'package:flutter/material.dart';
import 'package:flutter_happy/controller/add_controller.dart';
import 'package:flutter_happy/controller/app_controller.dart';
import 'package:get/get.dart';

class Add extends GetView<AddController> {
  final String text;

  const Add({this.text});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },

          child: 
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                _pictureZone(),
                _discriptionZone()
              ],
            ),
          ),
        ),

    );
  }

  get line => Container(
        height: 1,
        color: Colors.grey,
      );

  _pictureZone() {
    return InkWell(
        onTap: () {
          controller.pickImage();
        },
        child: Stack(
          children: [
            Obx(
              () => Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.black)),
                    height: 250,
                    child: controller.userModel.value.backgroundFile == null
                        ? Container(
                            child: Center(
                              child: Text('사진을 추가해 주세요'),
                            ),
                          )
                        : Image.file(
                            controller.userModel.value.backgroundFile,
                            fit: BoxFit.fill,
                          )),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Icon(
                    Icons.camera_alt,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  _discriptionZone() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          TextField(
            controller: controller.titleController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: '제목을 입력해 주세요'),
          ),

          SizedBox(height: 30,),
          TextField(
            controller: controller.discriptionController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: '내용을 입력해 주세요'), maxLength: 100,
          ),
          SizedBox(height: 15,),
          RaisedButton(
            onPressed: () {
              RouteController.to.backpage();
              controller.fetchData();
            },
            child: Text('입력'),
            color: Colors.limeAccent,
          )
        ],
      ),
    );
  }
}
