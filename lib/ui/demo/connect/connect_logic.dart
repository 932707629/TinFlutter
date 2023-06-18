
import 'package:get/get.dart';
import 'package:tin_flutter/app/error_response_handler.dart';
import 'package:tin_flutter/app/logger.dart';
import 'package:tin_flutter/app/network/app_connect.dart';
import 'package:tin_flutter/ui/bean/base_response_entity.dart';
import 'package:tin_flutter/ui/bean/chapter_info_entity.dart';

import 'connect_state.dart';

class ConnectLogic extends GetxController {
  final state = ConnectState();

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


  void createGet() async {

    var array = List.empty(growable: true);
    var future = AppConnect().get<BaseResponseEntity<List<ChapterInfoEntity>>>('/wxarticle/chapters/json',decoder: (data) => BaseResponseEntity.fromJson(data));
    loggerArray(['请求请求',future.runtimeType.toString()]);
    future.then((value){
      array.clear();
      value.body?.data?.forEach((element) {
        array.add(element.name);
      });
      state.result.value = '${array.toString()}';
    },onError:(error, stackTrace){
      ErrorResponseHandler().onErrorHandle(error,stackTrace: stackTrace);
    });
  }

  void createPost(){
    var formData = FormData({'k': "flutter"});
    AppConnect().post('/article/query/0/json', formData).then((value) => {
      state.result.value = '${value.bodyString}'
    },onError: (error, stackTrace) => {

    });
  }


}
