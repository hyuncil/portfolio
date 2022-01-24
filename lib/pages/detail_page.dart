import 'package:flutter/material.dart';
import 'package:flutter_happy/controller/add_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DetailPage extends GetView<AddController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _pictureZone(),
            _discriptionZone(),
          ],
        ),
      ),
    );
  }

  _pictureZone() {
    return Container(child:Image.network('https://image.news1.kr/system/photos/2019/1/20/3477555/article.jpg/dims/optimize',fit: BoxFit.fill,) ,
      height: 250,
      color: Colors.grey,
    );
  }

  _discriptionZone() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(controller.userModel.value.discription),
        ),line, _favoiteZone()],
    );
  }

  get line => Container(
        height: 1,
        color: Colors.grey,
      );

  _favoiteZone() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svg/icons/favorite_black_24dp.svg',
                width: 80,
                color: Colors.red,
              ),
         SizedBox(width: 25,), Text('좋아요 16 !!!',style: TextStyle(fontSize: 30),)  ],
          ),
          Text('좋아요를 눌러주세요')
        ],
      ),
    );
  }
}
