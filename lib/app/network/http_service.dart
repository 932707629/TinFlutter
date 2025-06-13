
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tin_flutter/app/tools/logger.dart';
import 'package:tin_flutter/app/network/error_response_handler.dart';
import 'package:tin_flutter/app/network/retrofit_client.dart';
import 'package:tin_flutter/ui/bean/base_response_entity.dart';
import 'package:tin_flutter/ui/bean/chapter_info_entity.dart';
class HttpService{

  static late RetrofitClient _client;

  static void doInit(){
    var dio = Dio();
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler){
        options.headers["Content-Type"] = "application/x-www-form-urlencoded";
        // options.headers["Accept-Language"] = Intr().currentLocale().languageCode;

        //设备信息【PC:PC网页端,MP:移动端,APP:原生APP】
        //网站ID
        //机器型号
        //系统版本号【APP强制使用】
        // var commonParams = {"machineModel":Constants.model(),"siteId":"9000","siteType":"1","terminal":"APP","version":Constants.version()};
        // options.queryParameters.addAll(commonParams);
        loggerArray(["发起请求","${options.baseUrl}${options.path}\n","${options.method}\n","${options.headers}\n",options.data ?? options.queryParameters]);
        handler.next(options);
      },
      onResponse: (response, handler){
        loggerArray(["返回响应",response.requestOptions.path,response.statusCode,"${response.statusMessage}\n",jsonEncode(response.data)]);
        if(response.statusCode == 200){
          handler.next(response);
        }else {
          ErrorResponseHandler().onErrorHandle({"code": response.statusCode,"message": response.statusMessage});
        }
      },
      onError: (DioException e, handler){
        loggerArray(["异常响应",e.toString()]);
        handler.next(e);
      }
    ));
    _client = RetrofitClient(dio);
  }



  ///游戏返回体
  ///封装请求体，自动处理各种异常问题
  static Future<T> buildFuture<T>(RequestCallback callback,{bool loading = true,bool needMsg = false,bool errorHandler = true}) async {
    // if(loading){ EasyLoading.show(maskType: EasyLoadingMaskType.black,status: Intr().jiazaizhong); }
    try{
      var value = await callback.call();
      // if(loading){ EasyLoading.dismiss(); }
      if(value.isOk()){
        ///data为null时处理
        return Future.value(value.data ?? (needMsg ? value.errorMsg.toString():""));
      } else {
        if(errorHandler){ ErrorResponseHandler().onErrorHandle({"code": value.errorCode,"message": value.errorMsg.toString()}); }
        return Future.error(value.errorMsg.toString());
      }
    }catch(error){
      loggerArray(["请求异常信息",error]);
      // if(loading){ EasyLoading.dismiss(); }
      if(errorHandler){ ErrorResponseHandler().onErrorHandle(error); }
      return Future.error(error);
    }
  }


  static Future<List<ChapterInfoEntity>> getChapters(){
    return buildFuture<List<ChapterInfoEntity>>(()=> _client.getChapters(),loading: false);
  }

  static Future<String> queryArticle(Map<String,dynamic> params,){
    return buildFuture<String>(()=> _client.queryArticle(params),loading: false);
  }





}


typedef RequestCallback = Future<BaseResponseEntity<dynamic>> Function();
