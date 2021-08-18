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
      logger.i("${S.current.sayHello(event.value)}");
      showToast(S.current.sayHello(event.value));
    });
  }

  @override
  void onClose() {
    super.onClose();
    subscription?.cancel();
  }

  void increase() => state.count.value+=50;


}
