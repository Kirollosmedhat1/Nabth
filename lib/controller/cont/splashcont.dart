

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';



class SplashScreenController extends GetxController {
  var firstAnimationCompleted = false.obs;
  var secondAnimationCompleted = false.obs;
  var textAnimationCompleted = false.obs;

  void completeFirstAnimation() {
    firstAnimationCompleted.value = true;
  }

  void completeSecondAnimation() {
    secondAnimationCompleted.value = true;
  }

  void completeTextAnimation() {
    textAnimationCompleted.value = true;
  }
}

