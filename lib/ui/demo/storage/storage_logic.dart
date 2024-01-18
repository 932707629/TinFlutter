import 'dart:math';

import 'package:get/get.dart';
import 'package:tin_flutter/app/app_data.dart';
import 'package:tin_flutter/app/res/dimens.dart';

import 'storage_state.dart';

class StorageLogic extends GetxController {
  final state = StorageState();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void increase(){
    state.localIndex.value = Random().nextInt(Dimens.i_1000);
    AppData.saveLocaleIndex(state.localIndex.value);
  }



}
