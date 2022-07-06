import 'package:get/get.dart';
import 'package:tin_flutter/app/network/app_connect.dart';

import 'connect_logic.dart';

class ConnectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConnectLogic());
    Get.lazyPut(() => AppConnect());
  }
}
