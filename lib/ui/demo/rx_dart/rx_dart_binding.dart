import 'package:get/get.dart';

import 'rx_dart_logic.dart';

class RxDartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RxDartLogic());
  }
}
