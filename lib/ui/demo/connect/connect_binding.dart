import 'package:get/get.dart';

import 'connect_logic.dart';

class ConnectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConnectLogic());
  }
}
