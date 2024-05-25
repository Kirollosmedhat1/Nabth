

import 'package:get/get.dart';



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

