import 'dart:async';
import 'package:get/get.dart';
import 'package:tin_flutter/app/global.dart';
import 'package:tin_flutter/ui/bean/event_task_bean.dart';

import 'multiplex_state.dart';

class MultiplexLogic extends GetxController {
  final state = MultiplexState();
  StreamSubscription<EventTaskBean>? subscription;

  @override
  void onReady() {
    super.onReady();
    subscription = behaviorBus.on<EventTaskBean>().listen((event) {
      logger.i('sayHello'.tr);//event.value
      showToast('sayHello'.tr);
    });
  }

  @override
  void onClose() {
    super.onClose();
    subscription?.cancel();
  }

  void increase() => state.count.value+=50;


}
