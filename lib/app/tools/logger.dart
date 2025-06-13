

import 'dart:developer';

import 'package:common_utils/common_utils.dart';
import 'package:tin_flutter/app/global.dart';


class Logger{

  static void init({
    String tag = 'TinFlutter',
    bool isDebug = false,
    int maxLen = 128,
  }) {
    LogUtil.init(tag: tag,isDebug: isDebug,maxLen: maxLen);
  }

}


void logger(dynamic message,{String name = ''}){
  if(isDebug) {
    log(dynamicToString(message),time: DateTime.now(),name: name);
  }
}

void loggerArray(Iterable<dynamic> iterable,{String name = ''}){
  if(isDebug) {
    logger(StringBuffer(iterable),name: name);
  }
}

void loggerV(Object? object, {String? tag}){
  LogUtil.v(object,tag: tag);
}

void loggerD(Object? object, {String? tag}){
  LogUtil.d(object,tag: tag);
}

void loggerE(Object? object, {String? tag}){
  LogUtil.e(object,tag: tag);
}


String dynamicToString(dynamic message){
  if(message == null){
    return 'null';
  }else if(message is String){
    return message;
  }else if(message is Map){
    return JsonUtil.encodeObj(message) ?? '';
  }else if(message is List){
    return message.map((e) => dynamicToString(e)).toList().toString();
  }else{
    return message.toString();
  }
}
