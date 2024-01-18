
import 'package:get/get.dart';
import 'package:tin_flutter/app/network/http_service.dart';
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

    HttpService.getChapters().then((value) {
      array.clear();
      value.forEach((element) {
        array.add(element.name);
      });
      state.result.value = '${array.toString()}';
    });
    // var future = AppConnect().get<BaseResponseEntity<List<ChapterInfoEntity>>>('/wxarticle/chapters/json',decoder: (data) => BaseResponseEntity.fromJson(data));
    // loggerArray(['请求请求',future.runtimeType.toString()]);
    // future.then((value){
    //   array.clear();
    //   value.body?.data?.forEach((element) {
    //     array.add(element.name);
    //   });
    //   state.result.value = '${array.toString()}';
    // },onError:(error, stackTrace){
    //   ErrorResponseHandler().onErrorHandle(error,stackTrace: stackTrace);
    // });
  }

  void createPost(){
    // var formData = FormData({'k': "flutter"});
    // AppConnect().post('/article/query/0/json', formData).then((value) => {
    //   state.result.value = '${value.bodyString}'
    // },onError: (error, stackTrace) => {
    //
    // });
    HttpService.queryArticle({'k': "flutter"}).then((value) {
      state.result.value = value;
    });
  }


}
