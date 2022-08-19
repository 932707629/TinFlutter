
import 'package:get/get.dart';
import 'package:tin_flutter/app/index.dart';
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
    AppConnect().get<BaseResponseEntity<List<ChapterInfoEntity>>>('/wxarticle/chapters/json',decoder: (data) => BaseResponseEntity.fromJson(data)).then((value){
      array.clear();
      value.body?.data?.forEach((element) {
        array.add(element.name);
      });
      state.result.value = '${array.toString()}';
    }).onError((error, stackTrace){
      logger.e('onError', error, stackTrace);
    });
  }

  void createPost() async {
    var formData = FormData({'k': "flutter"});
    AppConnect()
        .post('/article/query/0/json', formData)
        .then((value) => {
      logger.i('then', value.bodyString),
      state.result.value = '${value.bodyString}'
    }).onError((error, stackTrace) => {

    });
  }


}
