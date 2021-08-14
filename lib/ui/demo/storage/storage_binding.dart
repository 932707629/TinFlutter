import 'package:get/get.dart';

import 'storage_logic.dart';

class StorageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StorageLogic());
  }
}
