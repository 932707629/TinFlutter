import 'package:get/get.dart';

import 'loading_logic.dart';

class LoadingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoadingLogic());
  }
}
