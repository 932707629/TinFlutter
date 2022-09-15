import 'package:get/get.dart';
import 'package:tin_flutter/ui/demo/dynamic/dynamic_logic.dart';
import 'package:tin_flutter/ui/demo/home/home_logic.dart';
import 'package:tin_flutter/ui/demo/mine/mine_logic.dart';

import 'main_logic.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainLogic());
    Get.lazyPut(() => HomeLogic());
    Get.lazyPut(() => DynamicLogic());
    Get.lazyPut(() => MineLogic());

  }
}
