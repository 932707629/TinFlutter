import 'package:get/get.dart';

import 'multiplex_logic.dart';

class MultiplexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MultiplexLogic());
  }
}
