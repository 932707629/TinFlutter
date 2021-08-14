import 'dart:async';
import 'package:get/get.dart';
import 'package:tin_flutter/app/index.dart';
import 'package:tin_flutter/generated/l10n.dart';
import 'package:tin_flutter/ui/bean/EventTaskBean.dart';

import 'multiplex_state.dart';

class MultiplexLogic extends GetxController {
  final state = MultiplexState();
  StreamSubscription<EventTaskBean>? subscription;

  @override
  void onReady() {
    super.onReady();
    subscription = behaviorBus.on<EventTaskBean>().listen((event) {
      print("收到消息了${event.value}");
      showToast(S.current.sayHello(event.value));
    });
  }

  @override
  void onClose() {
    super.onClose();
    subscription?.cancel();
  }
}
