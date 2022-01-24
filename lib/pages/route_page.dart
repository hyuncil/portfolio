import 'package:flutter/material.dart';
import 'package:flutter_happy/controller/app_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'Top30.dart';
import 'add.dart';
import 'new.dart';
import 'search.dart';

class RoutePage extends GetView<RouteController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (RouteName.values[controller.currentIndex.value]) {
          case RouteName.New:
            return NewPage();
            break;
          case RouteName.Top:
            return Top30();
            break;

          case RouteName.Search:
            return Search();
            break;
          case RouteName.Add:
            return Add();
            break;
        }
        return Container();
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          showSelectedLabels: true,
          selectedItemColor: Colors.black,
          onTap: controller.changePageIndex,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg/icons/home_off.svg'),
                activeIcon: SvgPicture.asset('assets/svg/icons/home_on.svg'),
                label: '새로운사진'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg/icons/stars_black_24dp.svg'),
                activeIcon: SvgPicture.asset('assets/svg/icons/stars_black_24dp.svg',color: Colors.green,),
                label: '인기사진'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/icons/search_black_24dp.svg',
                ),
                activeIcon: SvgPicture.asset(
                  'assets/svg/icons/search_white_24dp.svg',
                  color: Colors.red,
                ),
                label: '검색'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/icons/note_add_black_24dp.svg',
                  width: 22,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/svg/icons/note_add_black_24dp.svg',color:Colors.blue,
                  width: 22,
                ),
                label: '사진추가'),
          ],
        ),
      ),
    );
  }
}
