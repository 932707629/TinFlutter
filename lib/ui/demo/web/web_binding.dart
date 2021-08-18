import 'package:get/get.dart';

import 'web_logic.dart';

class WebBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WebLogic());
  }




}
