import 'package:get/get.dart';

import 'count_logic.dart';

class CountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CountLogic());
  }

}
