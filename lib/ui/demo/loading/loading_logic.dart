import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

import 'loading_state.dart';

class LoadingLogic extends GetxController {
  final state = LoadingState();
  var subscription=CompositeSubscription();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    subscription.dispose();
    super.onClose();
  }

  void startProgress(){
    Stream.periodic(Duration(milliseconds: 100))
        .listen((event) {
       state.progress.value = state.progress.value+0.01;
    }).addTo(subscription);
  }

}
