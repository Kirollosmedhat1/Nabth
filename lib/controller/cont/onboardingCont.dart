import 'package:application5/controller/constant/imgs.dart';
import 'package:application5/controller/constant/textOnBoard.dart';
import 'package:application5/model/model_onboard.dart';
import 'package:application5/widgets/onboardwid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';


class OnBoardingCont extends GetxController {
  final controller = LiquidController();

  int currentPage = 0;

  final pages = [
    OnBoradingPageWidget(
        model: OnBoardingModel(
            image: on1,
            bgColor: Colors.white,
            title: title,
            subTitle: subtitle,
            height: 400)),
            
    OnBoradingPageWidget(
        model: OnBoardingModel(
            image: on2,
            bgColor: Colors.white,
            title: title1,
            subTitle: subtitle1,
            height: 400)),
    OnBoradingPageWidget(
        model: OnBoardingModel(
            image: on3,
            bgColor: Colors.white,
            title: title2,
            subTitle: subtitle2,
            height: 400)),
  ];

  onPageChangeCallback(int activePageIndex) {
    currentPage = activePageIndex;
    update();
  }

  skip() => controller.jumpToPage(page: 2);

  next() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }
  void onInit() {
    super.onInit();

    Future.delayed(Duration(milliseconds: 7324), () {
    
      Get.offNamed("login");
    });
  }
}
