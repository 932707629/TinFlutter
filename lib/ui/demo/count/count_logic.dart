
import 'package:get/get.dart';

import 'count_state.dart';

class CountLogic extends GetxController {
  final state = CountState();

  @override
  void onReady() {
    super.onReady();
    printInfo(info: "传递过来的参数: ${Get.arguments.toString()}");
  }

  @override
  void onClose() {
    super.onClose();
  }

  ///自增
  void increase() => ++state.count;

}
